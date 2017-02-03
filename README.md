# apt-repo
A docker file that exemplifies how to set up a local apt server for verifying that packages can be installed correctly through apt-get install commands.

Instructions:

    docker build --tag apt-repo .
    docker run --rm -it --entrypoint /bin/bash -p 80 apt-repo
    # You'll be dropped in to /var/repositories/ubuntu
    reprepro includedeb trusty <some .deb file you built>

    service nginx restart


That's it!
