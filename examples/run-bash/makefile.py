from makefilepy import Command, Makefile, Variable


docker_image = Variable(key='DOCKER_IMAGE', value='app')
command = Command(
    target='run-bash',
    recipes=[
        f'docker run --rm -it {docker_image.reference()} bash',
    ],
)
makefile = Makefile()

makefile.variables.append(docker_image)
makefile.commands.append(command)
makefile.build()
