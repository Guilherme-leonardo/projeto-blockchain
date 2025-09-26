// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PatientRegistry {
    struct Patient {
        string name;
        string cpf;
        uint age;
        string addressInfo;
    }

    mapping(string => Patient) private patients;
    mapping(string => bool) private registered;
    string[] private patientCpfs;

    event PatientRegistered(string cpf, string name, uint age, string addressInfo);

    // Registrar paciente — chamado pelo HTML
    function registerPatient(
        string memory _name,
        string memory _cpf,
        uint _age,
        string memory _addressInfo
    ) public {
        require(bytes(_name).length > 0, "Nome obrigatorio");
        require(bytes(_cpf).length > 0, "CPF obrigatorio");
        require(_age > 12, "Idade deve ser maior que 12");
        require(!registered[_cpf], "Paciente ja cadastrado");

        patients[_cpf] = Patient(_name, _cpf, _age, _addressInfo);
        registered[_cpf] = true;
        patientCpfs.push(_cpf);

        emit PatientRegistered(_cpf, _name, _age, _addressInfo);
    }

    // Consultar paciente — chamado pelo HTML
    function getPatient(string memory _cpf) public view returns (string memory, string memory, uint, string memory) {
        require(registered[_cpf], "Paciente nao encontrado");
        Patient memory p = patients[_cpf];
        return (p.name, p.cpf, p.age, p.addressInfo);
    }

    // Listar todos pacientes (opcional)
    function listPatients() public view returns (Patient[] memory) {
        Patient[] memory list = new Patient[](patientCpfs.length);
        for (uint i = 0; i < patientCpfs.length; i++) {
            list[i] = patients[patientCpfs[i]];
        }
        return list;
    }
}
