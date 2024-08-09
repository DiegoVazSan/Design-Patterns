//MARK: COMMAND

//MARK: 1 Command Interface
///Common interface for all commands.

protocol Command {
    func execute()
}

//MARK: 2 Reciver
/// This object execute the real operations
class Light {
    func turnOn() {
        print("Light is ON")
    }
    
    func turnOff() {
        print("Light is OFF")
    }
}

//MARK: 3 Implement Concrete Command
///Implements the Command protocol and knows how to perform the specific action on the Receiver.
class TurnOnLightCommand: Command {
    private let light: Light
    
    init(light: Light) {
        self.light = light
    }
    
    func execute() {
        light.turnOn()
    }
}

class TurnOffLightCommand: Command {
    private let light: Light
    
    init(light: Light) {
        self.light = light
    }
    
    func execute() {
        light.turnOff()
    }
}

//MARK: Invoker
///Holds a reference to a Command and can invoke the command. In this case, RemoteControl acts as the invoker.
class RemoteControl {
    private var command: Command?
    
    func setCommand(command: Command) {
        self.command = command
    }
    
    func pressButton() {
        command?.execute()
    }
}


//MARK: 5 Client Code
///Configure the Invoker with the specific command.
let light = Light()

let turnOnCommand = TurnOnLightCommand(light: light)
let turnOffCommand = TurnOffLightCommand(light: light)

let remote = RemoteControl()

// Encender la luz
remote.setCommand(command: turnOnCommand)
remote.pressButton()  // Output: Light is ON

// Apagar la luz
remote.setCommand(command: turnOffCommand)
remote.pressButton()  // Output: Light is OFF
