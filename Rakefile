require 'rake'
require 'fileutils'

task default: 'install'

desc "Hook dotfiles into system-standard positions."
task :install do
  puts '[Operation] Installing Dotfiles'
  install_symlinks
  Rake::Task["install_vundle"].execute
  install_vundles
  puts '[Info] Everything is awesome'
end

desc 'Updates dotfiles and Vim plugins'
task :update do
  run "cd $HOME/.dotfiles"
  run "git pull --rebase --prune"
  install_symlinks
  install_vundles
  puts '[Info] Everything is awesome'
end

desc 'Runs Vundle installer'
task :install_vundle do
  vundle_path = File.join('vim','bundle', 'vundle')
  unless File.exists?(vundle_path)
    puts '[Operation] Installing Vundle'
    run %{
      cd $HOME/.dotfiles
      git clone --branch v0.10.2 --depth 1 https://github.com/gmarik/vundle.git #{vundle_path}
    }
  end
end

desc 'Installs Homebrew and Brewfiles'
task :brew do
  # TODO: install brew and brew bundle
  # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  # brew tap Homebrew/bundle

  puts '[Operation] Installing packages'
  run %{
    brew bundle
    brew cleanup
  }
end

private

def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def create_symlinks(files)
  files.each do |f|
    file = f.split('/').last
    source = "#{ENV["PWD"]}/#{f}"
    target = "#{ENV["HOME"]}/.#{file}"

    puts "[Operation] Symlinking #{file}"
    puts "[Source] #{source}"
    puts "[Target] #{target}"

    if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    run %{ ln -nfs "#{source}" "#{target}" }
  end
end

def install_symlinks
  create_symlinks(Dir.glob('ruby/*'))
  create_symlinks(Dir.glob('git/*'))
  create_symlinks(Dir.glob('tigrc'))
  create_symlinks(Dir.glob('tmux.conf'))
  create_symlinks(Dir.glob('vimrc'))
  create_symlinks(Dir.glob('zshrc'))
  create_symlinks(Dir.glob('vim'))
  create_symlinks(Dir.glob('ctags'))
  create_symlinks(Dir.glob('agignore'))
end

def install_vundles
  puts '[Operation] Installing Vim plugins'
  system "vim --noplugin -u #{ENV['HOME']}/.vim/vundles.vim -N \"+set hidden\" \"+syntax on\" +BundleClean +BundleInstall +qall"
end
