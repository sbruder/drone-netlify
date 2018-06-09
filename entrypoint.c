#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    char* argv[6];

    argv[0] = "/netlifyctl";
    argv[1] = "deploy";
    argv[2] = "-y";
    argv[3] = "-A";
    //   4  = key
    argv[5] = NULL;

    if (access("netlify.toml", F_OK) == -1 ) {
        fprintf(stderr, "“netlify.toml” is missing, create it in your repository with “netlifyctl deploy”\n");
        return 1;
    }

    if (getenv("PLUGIN_KEY") != NULL) {
        argv[4] = getenv("PLUGIN_KEY");
    } else if (getenv("NETLIFY_KEY") != NULL) {
        argv[4] = getenv("NETLIFY_KEY");
    } else {
        fprintf(stderr, "No key specified!\n");
        return 2;
    }

    execv(argv[0], argv);
    perror("execve");

    return 3;
}
