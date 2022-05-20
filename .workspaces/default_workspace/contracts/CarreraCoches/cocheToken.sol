pragma solidity ^0.8.7;

import "./principal.sol";
import "./erc721.sol";

contract CocheToken is CarreraCoches, ERC721 {

  mapping (uint => address) confirmarTransferencia;

  function balanceOf(address _owner) external override view returns (uint256) {
    return numeroCochesPersona[_owner];
  }

  function ownerOf(uint256 _tokenId) external override view returns (address) {
    return cocheDePropietario[_tokenId];
  }

  function _transfer(address _from, address _to, uint256 _tokenId) private {
    numeroCochesPersona[_to]++;
    numeroCochesPersona[_from]--;
    cocheDePropietario[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }

  function transferFrom(address _from, address _to, uint256 _tokenId) external override payable {
    require (cocheDePropietario[_tokenId] == msg.sender || confirmarTransferencia[_tokenId] == msg.sender);
    _transfer(_from, _to, _tokenId);
  }

  function approve(address _approved, uint256 _tokenId) external override payable onlyOwnerOf(_tokenId) {
    confirmarTransferencia[_tokenId] = _approved;
    emit Approval(msg.sender, _approved, _tokenId);
  }

    

    /*function balanceOf(address _owner) external override virtual view returns (uint256){
        return numeroCochesPersona[_owner];
    }
    function ownerOf(uint256 _tokenId) external override virtual view returns (address){
        return cocheDePropietario[_tokenId];
    }


    function _transfer(address _from, address _to, uint256 _tokenId) private {
        numeroCochesPersona[_to]++;
        numeroCochesPersona[_from]--;
        cocheDePropietario[_tokenId] == _to;
        emit Transfer(_from, _to, _tokenId);
    }


    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes memory data) external override virtual payable{

    }
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external override virtual payable{

    }
    function transferFrom(address _from, address _to, uint256 _tokenId) external override virtual payable{
        _transfer(msg.sender, _to, _tokenId);
    }
    function approve(address _approved, uint256 _tokenId) external override virtual payable{
        confirmarTransferencia[_tokenId] = _approved;
        emit Approval(msg.sender, _approved, _tokenId);
    }
    function setApprovalForAll(address _operator, bool _approved) external override virtual{

    }
    function getApproved(uint256 _tokenId) external override virtual view returns (address){

    }
    function isApprovedForAll(address _owner, address _operator) external override virtual view returns (bool){

    }


    function takeOwnership(uint256 _tokenId) public {
        require(confirmarTransferencia[_tokenId] == msg.sender);
        address propietario = this.ownerOf(_tokenId);
        _transfer(propietario, msg.sender, _tokenId);
    }*/

}