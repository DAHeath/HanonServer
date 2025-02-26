module Paths_HanonServer (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/david/.cabal/bin"
libdir     = "/home/david/.cabal/lib/i386-linux-ghc-7.6.3/HanonServer-0.1"
datadir    = "/home/david/.cabal/share/i386-linux-ghc-7.6.3/HanonServer-0.1"
libexecdir = "/home/david/.cabal/libexec"
sysconfdir = "/home/david/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HanonServer_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HanonServer_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "HanonServer_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HanonServer_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HanonServer_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
