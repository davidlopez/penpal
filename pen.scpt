tell application "iTerm2"
  tell current session of current window
    write text "redis-server"
  end tell
  tell current window
    create tab with default profile
  end tell
  tell current session of current window
    write text "bundle exec sidekiq"
  end tell
  tell current window
    create tab with default profile
  end tell
  tell current session of current window
    write text "rails s"
  end tell
  tell current window
    create tab with default profile
  end tell
end tell
