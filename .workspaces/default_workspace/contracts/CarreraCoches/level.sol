pragma solidity ^0.8.7;

import "./principal.sol";

contract LevelCoches is CarreraCoches {

      modifier nivelAlcanzado(uint _nivel, address _address) {
       for(uint i = 0; i < listaCoches.length; i++){
            require(listaCoches[i].nivel == _nivel);
            _;
        }
        
    }

    function cambiarCoche(address _address, string memory _newModelo, string memory _newMarca) public nivelAlcanzado(10, _address) {
        require(msg.sender==_address);
        for(uint i = 0; i < listaCoches.length; i++){
            listaCoches[i].modelo = _newModelo;
            listaCoches[i].marca = _newMarca;
        }
        
    }

    

}