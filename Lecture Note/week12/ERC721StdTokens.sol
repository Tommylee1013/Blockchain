// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ERC165 {
    function supportsInterface(bytes4 interfaceID)
        external 
        view 
        returns(bool);
}

interface ERC721 is ERC165 {
    event Transfer(address indexed _from,
                  address indexed _to,
                  uint256 indexed _tokenId);
    event Approval(address indexed _owner,
                   address indexed _approved,
                   uint256 indexed _tokenId);
    event ApprovalForAll(address indexed _owner,
                         address indexed _operator,
                         bool _approved);
    
    function balanceOf(address _owner)
        external 
        view 
        returns(uint256);
    function ownerOf(uint256 _tokenId)
        external 
        view 
        returns(address);
    function safeTransferFrom(address _from,
                              address _to,
                              uint256 tokenId,
                              bytes calldata data)
        external 
        payable;
    //function safeTransferFrom(address _from, 
    //                          address _to, 
    //                        uint256 _tokenId) 
    //    external 
    //    payable;
    function transferFrom(address _from, 
                          address _to,
                          uint256 _tokenId) 
        external 
        payable;
    function approve(address _approved, 
                     uint256 _tokenId) 
        external
        payable;
    function setApprovalForAll(address _operator, 
                               bool _approved)
        external;
    function getApproved(uint256 _tokenId) 
        external 
        view 
        returns (address);
    function isApprovedForAll(address _owner, 
                              address _operator) 
        external 
        view 
        returns (bool);
}

interface ERC721TokenReceiver{
    function onERC721Received(address _operator,
                              address _from,
                              uint256 _tokenId,
                              bytes calldata _data)
        external 
        returns(bytes4);
}

contract ERC721StdNFT is ERC721 {
    address public founder;
    mapping(uint => address) internal _ownerOf;
    mapping(address => uint) internal _balanceOf;
    mapping(uint => address) internal _approvals;
    mapping(address => mapping(address => bool)) public _operatorApprovals;

    string public name;
    string public symbol;

    constructor (string memory _name,
                 string memory _symbol) {
        founder = msg.sender;
        name = _name;
        symbol = _symbol;
        
        for(uint tokenID = 1; tokenID <= 5; tokenID++) {
            _mint(msg.sender, tokenID);
        }
    }

    function _mint(address to, 
                   uint id)
        internal {
            require(to != address(0), "Error : mint to zero address");
            require(_ownerOf[id] == address(0), "Error : Already minted!");

            _balanceOf[to]++;
            _ownerOf[id] = to;

            emit Transfer(address(0), to, id);
        }
    
    function mintNFT(address to, 
                     uint256 tokenID)
        public {
            require(msg.sender == founder, "Error : You are not an authorized minter");
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
    
    function isApprovedForAll(address _owner,
                              address _operator)
        external 
        view 
        returns(bool) {
            return _operatorApprovals[_owner][_operator];
        }
    
    function approve(address _approved, 
                     uint256 _tokenId) 
        external 
        payable {
            address owner = _ownerOf[_tokenId];
            require(
                msg.sender == owner || _operatorApprovals[owner][msg.sender],
                "not authorized"
            );
            _approvals[_tokenId] = _approved;
            emit Approval(owner, _approved, _tokenId);
        }
    
    function setApprovalForAll(address _operator, 
                               bool _approved) 
        external {
            _operatorApprovals[msg.sender][_operator] = _approved;
            emit ApprovalForAll(msg.sender, _operator, _approved);
        }
    
    function transferFrom(address _from, 
                          address _to, 
                          uint256 _tokenId) 
        external 
        payable {
            _transferFrom( _from, _to, _tokenId);
        }

    function _transferFrom(address _from, 
                           address _to, 
                           uint256 _tokenId) 
        private {
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
    
    function safeTransferFrom(address _from, 
                              address _to, 
                              uint256 _tokenId, 
                              bytes calldata data) 
        external 
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