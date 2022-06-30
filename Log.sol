pragma solidity >= 0.8.7;

contract LogRegistry {
    // Задание:
    // 0. Создать enum с типом логов
    // (INFO, WARNING, ERROR)
    // 1. Добавить индексирование.
    // 2. Добавить функции поиска логов по:
    //   * интервалу времени
    //   * типу
    //   * слову из description

    address public admin;

    struct Module {
        string name;
        string description;
    }

    struct Log {
        uint logType;
        string text;
        uint time;
    }

    // Log[] public logList;
    Module[] public modules;
    mapping(uint => Log[]) public logs;

    modifier adminOnly() {
        require(msg.sender == admin,
        "Only admin can call this function");
        _;
    }

    event NewLog(uint logType, string text, uint time);

    constructor(address _admin) {
        admin = _admin;
    }

    function addModule(
        string memory _name,
        string memory _description
    )
    public adminOnly {
        modules.push(Module(_name, _description));
    }

    function addLog(
        uint _moduleId,
        uint _logType,
        string memory _text
    )
    public {
        logs[_moduleId].push(Log(_logType, _text, block.timestamp));
        emit NewLog(_logType, _text, block.timestamp);
    }
}