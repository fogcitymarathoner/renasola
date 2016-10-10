__author__ = 'marc'
import os
from fabric.api import run
from fabric.api import get
from fabric.api import local
from fabric.api import settings
from fabric.api import sudo, warn_only


SRC = '/home/marc/development/personal/django/renesola/'
PROJECT_DIR = '/home/marc/python_test_apps/renesola/'
AWS_DOC_ROOT_DIR = '/var/www/crm/'
AWS_PROJECT_DIR = '/marc/'
SETTINGS_DIR = PROJECT_DIR+'/renesola/'
MARCS_RSYNC = '-ahv'
RENESOLA_RSYNC = '-ahvre "ssh -i mykey02.pem" '
MARCS_PERSONAL_DEV_SERVER = 'marc@sfgeek.net'
AWS_DEV_SERVER = ' ubuntu@renesola.sfcrowd.com'
TEST_SERVERNAME='fogtest.com' # fogtest.com
TEST_SERVER_USER='marc' # fogtest.com
EXCLUDES = '--exclude="chef/" --exclude="*/worker.log" --exclude="*/locally_built_data/*" --exclude="*.pyc" --exclude=".idea/" --exclude="static/*" --exclude="*/tmp/*"   --exclude=".git*"'

def sync_commands(target='marc'):
    """
    default 'marc' marc's personal test server
    :param target:
    :return:
    """
    if target == 'marc':
        server_target = 'python_test_apps/renesola/'
        cmd1 =  'rsync  %s --delete   %s  %s %s:%s'%(MARCS_RSYNC, EXCLUDES, SRC, MARCS_PERSONAL_DEV_SERVER, server_target)
        # static/makefile
        cmd2 =  'rsync  %s   %sstatic/makefile %s:%sstatic'%(MARCS_RSYNC, SRC, MARCS_PERSONAL_DEV_SERVER, server_target)
        # crm/static
        cmd3 =  'rsync  %s %srenesola/apps/pricing/crm/static/img/* %s:%srenesola/apps/pricing/crm/static/img/'%(MARCS_RSYNC, SRC,
                                                                              MARCS_PERSONAL_DEV_SERVER,  server_target)
        cmd4 =  'rsync  %s %srenesola/apps/pricing/crm/static/css/* %s:%srenesola/apps/pricing/crm/static/css/'%(MARCS_RSYNC, SRC,
                                                                              MARCS_PERSONAL_DEV_SERVER,  server_target)
        # Note: Pulling chef off server (which is a chef workstation)
        cmd5 = 'rsync %s  %s:%schef/* chef'%(MARCS_RSYNC, MARCS_PERSONAL_DEV_SERVER, server_target)
        cmd6 = 'skipping for now freight/static/js for now'
    elif target == 'aws-test':
        server_target = '/marc/'
        cmd1 =  'rsync  %s --delete   %s  %s %s:%s'%(RENESOLA_RSYNC, EXCLUDES, SRC, AWS_DEV_SERVER, server_target)
        # static/makefile
        cmd2 =  'rsync  %s   %sstatic/makefile %s:%sstatic'%(RENESOLA_RSYNC, SRC, AWS_DEV_SERVER, server_target)
        # crm/static
        cmd3 =  'rsync  %s %srenesola/apps/pricing/crm/static/img/* %s:%srenesola/apps/pricing/crm/static/img/'%(RENESOLA_RSYNC, SRC,
                                                                                         AWS_DEV_SERVER,  server_target)
        cmd4 =  'rsync  %s %srenesola/apps/pricing/crm/static/css/* %s:%srenesola/apps/pricing/crm/static/css/'%(RENESOLA_RSYNC, SRC,
                                                                                         AWS_DEV_SERVER,  server_target)
        # Note: Pulling chef off server (which is a chef workstation)
        cmd5 = 'echo leaving chef alone on this server'

        cmd6 =  'rsync  %s %srenesola/apps/freight/static/js/* %s:%srenesola/apps/freight/static/js/'%(RENESOLA_RSYNC, SRC,
                                                                                         AWS_DEV_SERVER,  server_target)
    return (cmd1, cmd2, cmd3, cmd4, cmd5, cmd6)
def run_local_sync(cmd1, cmd2, cmd3, cmd4, cmd5, cmd6):
    print cmd1
    with warn_only():
        # not working in twosome
        local(cmd1)
    with warn_only():
        # not working in twosome
        local(cmd2)
    with warn_only():
        # not working in twosome
        local(cmd3)
    with warn_only():
        # not working in twosome
        local(cmd4)
    with warn_only():
        # not working in twosome
        local(cmd5)
    with warn_only():
        # not working in twosome
        local(cmd6)

def sync():
    """
    copy local changes in ~/personal/chef to sfgeek.net:rails_apps/rrg_chef using rsync
    :return:
    """
    print '################################################# SYNC START'
    (cmd1, cmd2, cmd3, cmd4, cmd5, cmd6) = sync_commands()
    run_local_sync(cmd1, cmd2, cmd3, cmd4, cmd5, cmd6)
def sync_aws_marcdev():
    """
    copy local changes in ~/personal/chef to sfgeek.net:rails_apps/rrg_chef using rsync
    :return:
    """
    print '################################################# SYNC START'
    (cmd1, cmd2, cmd3, cmd4, cmd5, cmd6) = sync_commands('aws-test')
    run_local_sync(cmd1, cmd2, cmd3, cmd4, cmd5, cmd6)

    print '################################################# SYNC END'

def collect_static_back():
    """
    calls collect static at server
    :return:
    """
    run('envs/renesola/bin/python /home/marc/python_test_apps/renesola/manage.py collectstatic --noinput')
def  collect_static_front():
    """
    call collect static from dev computer
    :return:
    """
    local('fab -H %s@%s collect_static_back'%(TEST_SERVER_USER, TEST_SERVERNAME))

def collect_static_back_aws_marcdev():
    """
    calls collect static at server
    :return:
    """
    run('python /marc/manage.py collectstatic --noinput')
def  collect_static_front_aws_marcdev():
    """
    call collect static from dev computer
    :return:
    """
    local('fab -i mykey02.pem -H %s collect_static_back_aws_marcdev'%(AWS_DEV_SERVER))

def test_back():
    """
    runs tests at server
    :return:
    """
    run('cd %s ; source ~/envs/renesola/bin/activate && python manage.py test'%(PROJECT_DIR))
def correct_py_file_mode():
    local('find . | grep \.py$ | xargs chmod 664')
def test_front():
    """
    runs tests from dev
    :return:
    """
    correct_py_file_mode()
    sync()
    local('fab -H %s@%s test_back'%(TEST_SERVER_USER, TEST_SERVERNAME))


def make_clean_back():
    """
    calls make clean at manage.py directory - completely rebuilds discount_calculator.js
    should delete discount_calculator/discount_calculator.js and discount_calculator/data/categories.coffee
    :return:
    """

    print '################################################# MAKECLEAN COFFEE START'
    cmd = 'cd %s; make clean; make'%(PROJECT_DIR)
    run(cmd)

    print '################################################# MAKECLEAN COFFEE END'

def make_clean_front():
    """
    calls make clean at manage.py directory
    should delete discount_calculator/discount_calculator.js and discount_calculator/data/categories.coffee
    :return:
    """

    print '################################################# COMPILE COFFEE START'
    local('fab -H %s@%s make_clean_back'%(TEST_SERVER_USER, TEST_SERVERNAME))

    print '################################################# COMPILE COFFEE END'

def make_php_aws_back():
    """
    calls make clean at manage.py directory - completely rebuilds discount_calculator.js
    should delete discount_calculator/discount_calculator.js and discount_calculator/data/categories.coffee
    :return:
    """

    print '################################################# COPY PHP APP  START'
    cmd = 'cd %s; make php'%(AWS_PROJECT_DIR)
    run(cmd)

    print '################################################# COPY PHP APP  END'

def make_php_aws_front():
    """
    calls make clean at manage.py directory
    should delete discount_calculator/discount_calculator.js and discount_calculator/data/categories.coffee
    :return:
    """

    print '################################################# COPY PHP APP START'

    cmd = 'fab -i mykey02.pem -H %s@%s make_php_aws_back'%('ubuntu', 'renesola.sfcrowd.com')
    local(cmd)
    print '################################################# COPY PHP APP  END'

def compile_coffee_back():
    """
    compile coffee script at server
    :return:
    """
    # concatenate discount calculator scripts

    print '################################################# COMPILE COFFEE START'
    cmd = 'cd %s; make clean'%(PROJECT_DIR)
    run(cmd)

    print '################################################# COMPILE COFFEE END'

def compile_coffee_front():
    """
    compile coffee script from dev computer
    :return:
    """
    local('fab -H %s@%s compile_coffee_back'%(TEST_SERVER_USER, TEST_SERVERNAME))


def compile_coffee_back_aws_marcdev():
    """
    compile coffee script at server
    :return:
    """
    # concatenate discount calculator scripts

    print '################################################# COMPILE COFFEE START'
    cmd = 'cd %s; make clean'%(AWS_PROJECT_DIR)
    run(cmd)

    print '################################################# COMPILE COFFEE END'

def compile_coffee_front_aws_marcdev():
    """
    compile coffee script from dev computer
    :return:
    """
    local('fab  -i mykey02.pem -H %s compile_coffee_back_aws_marcdev'%(AWS_DEV_SERVER))



def start_back():
    """
    start server at server
    :return:
    """
    run('sudo supervisorctl start dj_renesola')

def start_front():
    """
    start server from dev computer
    :return:
    """
    local('fab -H %s@%s start_back'%(TEST_SERVER_USER, TEST_SERVERNAME))


def stop_back():
    """
    stop server at server
    :return:
    """
    run('sudo supervisorctl stop dj_renesola')

def stop_front():
    """
    stop server from dev computer
    :return:
    """
    local('fab -H %s@%s stop_back'%(TEST_SERVER_USER, TEST_SERVERNAME))



def restart_back():
    """
    restart server at server
    :return:
    """
    run('sudo supervisorctl stop dj_renesola')
    run('sudo supervisorctl start dj_renesola')

def restart_front():
    """
    restart server from dev computer
    :return:
    """
    local('fab -H %s@%s restart_back'%(TEST_SERVER_USER, TEST_SERVERNAME))


def cp_style():
    """
    copy style sheet directly without collectstatic
    :return:
    """
    local('scp renesola/apps/pricing/crm/static/css/styles.css %s@%s:python_test_apps/renesola/static/css'%(TEST_SERVER_USER, TEST_SERVERNAME))


def cp_style_aws_marcdev():
    """
    copy style sheet directly without collectstatic
    :return:
    """
    local('scp  -i mykey02.pem  renesola/apps/pricing/crm/static/css/styles.css %s:/marc/static/css'%(AWS_DEV_SERVER))


def show_urls_back():
    """
    calls collect static at server
    :return:
    """
    run('envs/renesola/bin/python /home/marc/python_test_apps/renesola/manage.py show_urls')
def  show_urls_front():
    """
    call collect static from dev computer
    :return:
    """
    local('fab -H %s@%s show_urls_back'%(TEST_SERVER_USER, TEST_SERVERNAME))

def chef_client_back():
    """

    :return:
    """
    run('sudo chef-client')
def chef_client_front():
    """
    run sudo chef-client to run servers runlist
    :return:
    """

    local('fab -i mykey02.pem -H %s@%s chef_client_back'%('ubuntu', 'ec2-52-11-251-220.us-west-2.compute.amazonaws.com'))
def git_pull_back():
    run('cd /var/www/crm && git pull')

def git_pull_front():
    cmd = 'fab -i mykey02.pem -H %s@%s git_pull_back'%('ubuntu', 'renesola.sfcrowd.com')
    print cmd
    local(cmd)


def update_dev_server_back():
    """
    compile coffee script at server
    :return:
    """
    # concatenate discount calculator scripts

    print '################################################# COMPILE COFFEE START'
    cmd = 'cd %s; git pull; make clean; python manage.py collectstatic --noinput'%(AWS_DOC_ROOT_DIR)
    run(cmd)
    cmd = 'sudo supervisorctl restart dj_renesola_kombu'
    run(cmd)

    print '################################################# COMPILE COFFEE END'

def update_dev_server_front():
    """
    do a checkout, collect static, restart worker, compile coffee
    :return:
    """
    local('fab  -i mykey02.pem -H %s update_dev_server_back'%(AWS_DEV_SERVER))

def cp_marcdev_freight_calculator_js():
    """
    do a checkout, collect static, restart worker, compile coffee
    :return:
    """
    local('scp  -i mykey02.pem renesola/apps/freight/static/js/freight_calculator.js %s:/marc/static/js'%(AWS_DEV_SERVER))
