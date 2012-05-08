#!/usr/bin/env groovy

cls = args.collect({ it.replace(",", "") })

cls.forEach{
    runCommand({"p4 change -o ${it}"})
}

def runCommand(p4Command){
    println p4Command
    new CommandExecutor().execute(p4Command) 
}
//def executor = new CommandExecutor();
//executor.execute(integrateCommand).execute("p4 resolve -am")
println cls
