// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ToDoList {

    struct ToDo {
        string Text;
        bool completed;
    }

    ToDo[] public ToDos;

    function MakeList(string calldata task) public  {
        ToDos.push(ToDo({
            Text: task,
            completed: false
        }));
    }

    function updateList(uint _index, string calldata newTask) public {
        ToDos[_index].Text = newTask;
    }

    function toggleCompleted(uint _index) public {
        ToDos[_index].completed = !ToDos[_index].completed;
    }
    
    function get(uint _index) external view returns (string memory) {
        return ToDos[_index].Text;
    }


} 
