from makefilepy import Command, Makefile, Variable


variable = Variable(
    key='test',
    value='test'
)

command = Command(
    target='up',
    prerequisites=[
        'docker-compose.yml'
    ],
    recipes=[
        'docker-compose up'
    ],
    phony=True,
)

makefile = Makefile()

makefile.variables.append(variable)
makefile.commands.append(command)
makefile.build(filename='test.txt')
