class Deploy < Thor
  include Thor::Actions

  desc "github", "deploy to GitHub Pages"
  def github
    original_path = Dir.pwd
    deploy_path = "/Users/morgan/Documents/sophomorgan.github.io"
    puts "Running Jekyll build --destination #{deploy_path}"
    run "jekyll build --destination #{deploy_path}"

    puts "Committing all changes"
    run "cd #{deploy_path} && git add -A . && git commit -m 'Run jekyll build at #{Time.now}'"
    puts "Deploying to GitHub"
    run "cd #{deploy_path} && git push -f origin master"

    puts "Donezies!"
    run "cd #{original_path}"
  end

  desc "github_drafts", "deploy to GitHub Pages with drafts"
  def github_drafts
    original_path = Dir.pwd
    deploy_path = "/Users/morgan/Documents/sophomorgan.github.io"
    puts "Running Jekyll build --drafts --destination #{deploy_path}"
    run "jekyll build --drafts --destination #{deploy_path}"

    puts "Committing all changes"
    run "cd #{deploy_path} && git add -A . && git commit -m 'Run jekyll build at #{Time.now}'"
    puts "Deploying to GitHub"
    run "cd #{deploy_path} && git push -f origin master"

    puts "Donezies!"
    run "cd #{original_path}"
  end

  desc "local", "deploy locally"
  def local
    original_path = Dir.pwd
    deploy_path = "/Users/morgan/Desktop/blerg"
    puts "Running Jekyll build --destination #{deploy_path}"
    run "jekyll build --destination #{deploy_path}"
    puts "Donezies!"
    run "cd #{original_path}"
  end

end
