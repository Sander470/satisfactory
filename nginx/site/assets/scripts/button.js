function makeServerState(button) {
    const buttonName = button.name;
    let confirm = document.getElementById("confirm")

    switch (buttonName) {
        case "refresh":
            confirm.innerHTML = "refresh";
            break;
        
        case "start":
            confirm.innerHTML = "start"
            break;
        
        case "stop":
            confirm.innerHTML = "stop"
            break;
        
        case "restart":
            confirm.innerHTML = "restart"
            break;

    
        default:
            break;
    }
}
