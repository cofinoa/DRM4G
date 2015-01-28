__all__ = ["communicators", "core", "managers", "utils", "commands"]

__version__  = '2.2.0'
__author__   = 'Carlos Blanco'
__revision__ = "$Id$"

import sys
import os
import logging.config
from os.path import dirname , join , expandvars , exists , abspath

if sys.version_info < (2,5) and sys.version_info > (3,0):
    exit( 'The version number of the Python has to be > = 2.5 and < 3.0' )

########################################
# Default values used in DRM4G package.#
########################################
HOME                 = os.environ.get( 'HOME' )
DRM4G_DIR            = os.environ.get( 'DRM4G_DIR' , join ( HOME , '.drm4g' ) )
os.environ[ 'GW_LOCATION' ] = DRM4G_DIR
DRM4G_DEPLOYMENT_DIR = dirname( dirname( dirname( abspath( __file__ ) ) ) )
DRM4G_BIN            = join( DRM4G_DEPLOYMENT_DIR , 'bin'  ) 
DRM4G_CONFIG_FILE    = join( DRM4G_DIR , 'etc' , 'resources.conf' )
DRM4G_LOGGER         = join( DRM4G_DIR , 'etc' , 'logger.conf')
DRM4G_DAEMON         = join( DRM4G_DIR , 'etc' , 'gwd.conf')
DRM4G_SCHED          = join( DRM4G_DIR , 'etc' , 'sched.conf')

logging.basicConfig( format='%(message)s', level = logging.INFO , stream = sys.stdout )
logger = logging.getLogger(__name__) 
if exists( DRM4G_DIR ) is False  :
    logger.info( "Creating a DRM4G local configuration in '%s'" %  DRM4G_DIR )
    abs_dir = join ( DRM4G_DIR , 'var' , 'acct' )
    logger.info( "Creating '%s' directory" % abs_dir )
    os.makedirs( abs_dir )
    from  shutil import copytree
    src  = join ( DRM4G_DEPLOYMENT_DIR , 'etc' )
    dest = join ( DRM4G_DIR            , 'etc' )
    logger.info( "Coping from '%s' to '%s'" % ( src , dest ) )
    copytree( src , dest )

REMOTE_JOBS_DIR = "~/.drm4g/jobs"
REMOTE_VOS_DIR  = "~/.drm4g/security"
    
# ssh communicator
SSH_PORT            = 22
SSH_CONNECT_TIMEOUT = 30 # seconds
SFTP_CONNECTIONS    = 3

# Proxy
PROXY_THRESHOLD     = 178 # Proxy threshold in hours.
    
COMMUNICATORS = {
                 "ssh"   : "drm4g.communicators.ssh",
                 "local" : "drm4g.communicators.local",
                 }
RESOURCE_MANAGERS = {
                     "pbs"          : "drm4g.managers.pbs",
                     "sge"          : "drm4g.managers.sge",
                     "fork"         : "drm4g.managers.fork",         
                     "none"         : "drm4g.managers.fork",
                     "lsf"          : "drm4g.managers.lsf",
                     "loadleveler"  : "drm4g.managers.loadleveler",
                     "cream"        : "drm4g.managers.cream",
                     "slurm"        : "drm4g.managers.slurm",
                     "mnslurm"      : "drm4g.managers.marenostrum",
                     "altamira"     : "drm4g.managers.altamira",
                     "neptuno"      : "drm4g.managers.neptuno",
                     }

# Create a history file for drm4g commands
try:
    import readline
    import atexit
    # history file
    histfile = join(  DRM4G_DIR , 'var' , '.drm4g_history' )
    try:
        readline.read_history_file( histfile )
    except IOError:
        pass
    atexit.register(readline.write_history_file, histfile)
    del histfile, readline, atexit
except Exception:
    pass
