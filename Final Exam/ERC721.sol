// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

interface ERC165 {
    function supportsInterface(bytes4 interfaceID)
        external 
        view 
        returns(bool);
}

interface ERC721 is ERC165 {
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 indexed _tokenId
    );

    event Approval(
        address indexed _owner,
        address indexed _approved,
        uint256 indexed _tokenId
    );

    event ApprovalForAll(
        address indexed _owner,
        address indexed _operator,
        bool _approved
    );
    
    function balanceOf(address _owner)
        external 
        view 
        returns(uint256);
    function ownerOf(uint256 _tokenId)
        external 
        view 
        returns(address);
    function safeTransferFrom(
        address _from,
        address _to,
        uint256 tokenId,
        bytes calldata data
    )   external 
        payable;
    //function safeTransferFrom(
    //    address _from, 
    //    address _to, 
    //    uint256 _tokenId 
    //)   external 
    //    payable;
    function transferFrom(
        address _from, 
        address _to,
        uint256 _tokenId
    )   external 
        payable;
    function approve(
        address _approved, 
        uint256 _tokenId
    )   external
        payable;
    function setApprovalForAll(
        address _operator, 
        bool _approved
    )   external;
    function getApproved(uint256 _tokenId) 
        external 
        view 
        returns (address);
    function isApprovedForAll(
        address _owner, 
        address _operator
    )   external 
        view 
        returns (bool);
}

interface ERC721TokenReceiver{
    function onERC721Received(
        address _operator,
        address _from,
        uint256 _tokenId,
        bytes calldata _data
    )   external 
        returns(bytes4);
}

contract ERC721StdNFT is ERC721 {
    address public founder;

    mapping (uint => address) internal _ownerOf; // 주소 확인
    mapping (address => uint) internal _balanceOf; // token을 얼마나 가지고 있는지 확인
    mapping (uint => address) internal _approvals; // Token ID가 누구에게 허락이 되어 있는지 확인
    mapping (address => mapping(address => bool)) public _operatorApprovals; // 위임거래

    string public name;
    string public symbol;

    constructor (
        string memory _name, 
        string memory _symbol
    ) {
        founder = msg.sender;
        name = _name;
        symbol = _symbol;

        for (uint tokenID = 1; tokenID <= 5; tokenID++) {
            _mint(msg.sender, tokenID);
        }
    }

    function _mint(
        address to, 
        uint id
    )   internal {
        require(to != address(0), "mint to zero address");
        require(_ownerOf[id] == address(0), "already minted"); // 0이 아니라면 이미 발행된 것이라 보면 된다

        _balanceOf[to]++;
        _ownerOf[id] = to;

        emit Transfer(address(0), to, id); // 최초발행 : 0으로부터 to로 발행하고, id를 발급함
    }

    function mintNFT( // to 주소로 토큰 발행
        address to,
        uint256 tokenID
    )   public {
        require(msg.sender == founder, "Error : you are not authorized minter");
        _mint(to, tokenID);
    }

    function ownerOf(uint256 _tokenID)
        external 
        view 
        returns(address) {
            address owner = _ownerOf[_tokenID];
            require(owner != address(0), "Error : Token does not exist");
            return owner;
        }

    function balanceOf(address _owner)
        external 
        view 
        returns(uint256) {
            require(_owner != address(0), "Error : balance query for the zero address");
            return _balanceOf[_owner];
        }
    
    function getApproved(uint256 _tokenID)
        external 
        view 
        returns(address) {
            require(_ownerOf[_tokenID] != address(0), "Error : token does not exist");
            return _approvals[_tokenID];
        }
    
    function isApprovedForAll(
        address _owner,
        address _operator
    )   external 
        view 
        returns(bool) {
            return _operatorApprovals[_owner][_operator];
        }
    
    function approve(
        // 주어진 토큰 ID의 전송을 다른 주소에게 허가
        // 토큰 소유자나 승인된 운영자만이 호출 가능
        address _approved, 
        uint256 _tokenId
    )   external 
        payable {
            address owner = _ownerOf[_tokenId];
            require(
                msg.sender == owner || _operatorApprovals[owner][msg.sender], // 소유자 및 승인된 운영자만 호출 가능
                "not authorized"
            );
            _approvals[_tokenId] = _approved;
            emit Approval(owner, _approved, _tokenId);
        }
    
    function setApprovalForAll(
        // 주어진 운영자의 승인을 설정 또는 해제
        // 운영자는 발신자를 대신하여 모든 토큰을 전송할 수 있도록 허가 또는 해제
        address _operator, 
        bool _approved
    )   external {
            _operatorApprovals[msg.sender][_operator] = _approved;
            emit ApprovalForAll(msg.sender, _operator, _approved);
        }
    
    function transferFrom(
        address _from, 
        address _to, 
        uint256 _tokenId
    )   external 
        payable {
            _transferFrom( _from, _to, _tokenId);
        }

    function _transferFrom(
        // 주어진 토큰 ID의 소유권을 다른 주소로 전송
        // msg.sender는 소유자, 승인된 주소, 운영자여야 함 -> modifier로 가능하지않나?
        address _from, 
        address _to, 
        uint256 _tokenId
    )   private {
            address owner = _ownerOf[_tokenId];
            require(_from == owner, "from != owner");
            require(_to != address(0), "transfer to zero address");
            require(msg.sender == owner
                || msg.sender == _approvals[_tokenId]
                || _operatorApprovals[owner][msg.sender]);//, "msg.sender not in {owner,operator,approved}");
            _balanceOf[_from]--;
            _balanceOf[_to]++;
            _ownerOf[_tokenId] = _to;
            delete _approvals[_tokenId];
            emit Transfer(_from, _to, _tokenId);
        }
    
    function safeTransferFrom( // 받을 수 있는 이들에게만 전송가능하도록 함 (안전하게 전송)
        address _from, 
        address _to, 
        uint256 _tokenId, 
        bytes calldata data
    )   external 
        payable {
            _transferFrom(_from, _to, _tokenId);
            require(_to.code.length == 0 ||
                    ERC721TokenReceiver(_to).onERC721Received(msg.sender, _from, _tokenId, data) ==
                    ERC721TokenReceiver.onERC721Received.selector,
                    "Error : unsafe recipient"
                );
        }
    
    function supportsInterface(bytes4 interfaceId) 
        external 
        pure 
        returns (bool) {
            return
                interfaceId == type(ERC721).interfaceId ||
                interfaceId == type(ERC165).interfaceId;
        }
}