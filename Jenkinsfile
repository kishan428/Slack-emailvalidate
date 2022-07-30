pipeline {
    agent any
    
    parameters { 
        //booleanParam(name: 'Slack_notify', defaultValue: false, description: 'Send a Notification to Slack') 
        string(name: 'slack_channel', defaultValue: 'none', description: 'Send noitfication to Slack Channel.')
        //booleanParam(name: 'Email_notify', defaultValue: false, description: 'Send a Notification to Email')
        string(name: 'EmailAddress', defaultValue: 'none', description: 'Send notification to Email address.')
        choice(name: 'email', choices: ['none', 'kishan@gmail.com', 'udhay@gmail.com'], description: 'choose email' )
        string(name: 'Calling AnotherJob', defaultValue: '', description: 'calling Cloudauth-notify')
        string(name: 'Message', defaultValue: '', description: 'Message to send. Required')
        
    }

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                // sh move
                build job: "cloudauth-notify"
            }
        }
         stage('Emailvalidate') {
            steps {
                withEnv(['PATH+EXTRA=/usr/sbin:/usr/bin:/sbin:/bin']) { 
                sh '''
                   authEmail="nagendra.ks@test.com"
                   echo "$authEmail"
                   if [[ "$authEmail" =~ ^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(test)\.com$ ]]; then
                   echo "Proper Email detected $authEmail"
                   else
                   echo "Email address $authEmail is invalid."
                   fi
                '''
                }      
            }
        }
    }
    post 
    {
        success
        {
            //slackSend channel: 'cloudauth-operations-qa'
            slackSend channel: "${slack_channel}", color: '#2eb8b7', 
            message: "Build Status: ${currentBuild.currentResult}\n Job Name: ${env.JOB_NAME}\n Build Number: ${env.BUILD_NUMBER}\n Build URL: ${env.BUILD_URL}", 
            tokenCredentialId: '6a8e2866-29e3-4283-8461-d823ca73c3f5'
        }
        failure
        {
          script {
            //slackSend channel: 'cloudauth-operations-qa'
            slackSend channel: "${slack_channel}", color: '#D14748', 
            message: "Build Status: ${currentBuild.currentResult}\n Job Name: ${env.JOB_NAME}\n Build Number: ${env.BUILD_NUMBER}\n Build URL: ${env.BUILD_URL}",
            tokenCredentialId: '6a8e2866-29e3-4283-8461-d823ca73c3f5'
        }
        always
        {
            deleteDir ()
        }
}
}
}
