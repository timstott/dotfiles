require 'rake'
require 'fileutils'

task default: 'install'

desc "Hook dotfiles into system-standard positions."
task :install do
  puts "======================================================"
  puts "Installing Dotfiles"
  puts "======================================================"
  puts

  install_symlinks
  Rake::Task["install_vundle"].execute
  install_vundles
end

task :update do

  run "cd $HOME/.dotfiles"
  run "git pull --rebase --prune"
  install_symlinks
  install_vundles
end

desc "Runs Vundle installer"
task :install_vundle do
  puts "======================================================"
  puts "Installing Vundle."
  puts "======================================================"
  puts

  vundle_path = File.join('vim','bundle', 'vundle')
  unless File.exists?(vundle_path)
    run %{
      cd $HOME/.dotfiles
      git clone --branch v0.10.2 --depth 1 https://github.com/gmarik/vundle.git #{vundle_path}
    }
  end
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

    puts "======================#{file}=============================="
    puts "Source: #{source}"
    puts "Target: #{target}"

    if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    run %{ ln -nfs "#{source}" "#{target}" }

    puts "=========================================================="
    puts
  end
end

def install_symlinks
  create_symlinks(Dir.glob('ruby/*'))
  create_symlinks(Dir.glob('git/*'))
  create_symlinks(Dir.glob('tigrc'))
  create_symlinks(Dir.glob('tmux/*'))
  create_symlinks(Dir.glob('vimrc'))
  create_symlinks(Dir.glob('zshrc'))
  create_symlinks(Dir.glob('vim'))
  create_symlinks(Dir.glob('ctags'))
  create_symlinks(Dir.glob('agignore'))
end

def install_vundles
  system "vim --noplugin -u #{ENV['HOME']}/.vim/vundles.vim -N \"+set hidden\" \"+syntax on\" +BundleClean +BundleInstall +qall"
end
