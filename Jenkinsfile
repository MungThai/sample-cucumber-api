pipeline {
    agent any

    // this section configures Jenkins options
    options {

        // only keep 10 logs for no more than 10 days
        buildDiscarder(logRotator(daysToKeepStr: '10', numToKeepStr: '10'))

        // cause the build to time out if it runs for more than 12 hours
        timeout(time: 12, unit: 'HOURS')

        // add timestamps to the log
        timestamps()
    }

    // this section configures triggers
    triggers {
          // create a cron trigger that will run the job every day at midnight
          // note that the time is based on the time zone used by the server
          // where Jenkins is running, not the user's time zone
          cron '@midnight'
    }

    // the pipeline section we all know and love: stages! :D
    stages {
         stage('Clone Git Repository') {
            steps {
                checkout scmGit(
                    branches: [
                        [
                            name: '*/MungThai'
                        ]
                    ], 
                    extensions: [], 
                    userRemoteConfigs: 
                    [
                        [
                            credentialsId: '2f2aa6ed-af1e-4e3d-ae52-5af09ed16023', 
                            url: 'https://github.com/MungThai/sample-cucumber-api.git'
                        ]
                    ]
                )
            }
         }
        stage('Test') {
            steps {
                echo 'Run Testing..'
                sh (script: 'gradle cukes -Dcukes.env=devtest -Dcukes.testsuite=apitests')
            }
        }
        stage('Report') {
            steps {
                echo 'Reporting....'
            }
        }
    }

    // the post section is a special collection of stages
    // that are run after all other stages have completed
    post {

        // the always stage will always be run
        always {

            // the always stage can contain build steps like other stages
            // a "steps{...}" section is not needed.
            echo "This step will run after all other steps have finished.  It will always run, even in the status of the build is not SUCCESS"
        }
    }
}
