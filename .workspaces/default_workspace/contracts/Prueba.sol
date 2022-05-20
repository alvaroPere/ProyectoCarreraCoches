pragma solidity ^0.4.19;

contract Prueba {


    struct Alumno {
        uint id;
        string nombre;
    }


    mapping (uint => string) public alum;

    function setMapping(uint _id, string _nombre) public {
        alum[_id] = _nombre;
    }

}