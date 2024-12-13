// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ToDoList {

    struct ToDo {
        string task;
        bool completed;
    }

    ToDo[] public ToDos;

    function MakeList(string calldata _task) public  {
        ToDos.push(ToDo({
            task: _task,
            completed: false
        }));
    }

    function updateList(uint _index, string calldata newTask) public {
        ToDos[_index].task = newTask;
    }

    function toggleCompleted(uint _index) public {
        ToDos[_index].completed = !ToDos[_index].completed;
    }
    
    function get(uint _index) external view returns (string memory, bool ) {
        ToDo storage todo = ToDos[_index];
        return (todo.task, todo.completed);
    }


} 
