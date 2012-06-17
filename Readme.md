Journal Archiver
================

A little piece of code put together for a friend. This crawls data and download files and save them in the structure

Installation
------------

Assuming you're not familiar with git, github, rvm and bundler, this is the alternative:

1. Download the code on your hard drive
2. Install Ruby 1.9 if you only have ruby 1.8 (check by "ruby -v" in the terminal). For Windows: http://rubyinstaller.org/
3. Open up the terminal:

    $ cd JournalArchiver
    $ gem install bundler
    $ bundle

4. If the last step "bundle" fails, try "bundle install --without test" instead
5. Open file run.rb in a text editor and read it. To run it in the terminal:

    $ ruby run.rb

    (in unix systems, just "./run.rb" instead)

6. To perform a "dry" run which does not write to file but only print out the filenames in the terminal, use

    $ DRY=true run

7. If you cancel "run" halfway, next time when you restart it, it will start form the beginning but will skip any files are already exists. So if you want to override the files, use:

    $ FORCE=true run

    (or you can just remove the previously generated files)

Notes
-----

Take a look at the "output" folder. It has some data that I already ran with the JEP site. You can change the output folder name in `run.rb`

Known Issues
------------

* Not all Full-Text Article links are downloadable by default. Most of the Full-Text Article links under JEP are download (they have a 'Complimentary' text next to the link), but journals like "American Economic Review" requires you to access from a known affiliated IP address or have logged in. Therefore this script may work out of the box for you if you access from your campus IP address, but I'm not sure. If you have the login credentials we can modify the script to log in on your behalf.
* Some article names contain characters that would be invalid in filenames so you may see some characters being replaced. I didn't sanitize the filenames strictly enough so that it's more readable, but that means it's guaranteed to produce invalid filenames. If you run into this problem, you can modify the `Archiver#sanitize_filename` method.
