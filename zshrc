# a pop up notification and sound alert (using the built-in sounds for macOS)

# Requires https://github.com/caarlos0/timer to be installed
# brew install terminal-notifier
# brew install caarlos0/tap/timer

# Mac setup for pomo
alias work="timer 60m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"
        
alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"
