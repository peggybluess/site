{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_transient (
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
version = Version [0,4,4] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/root/.cabal/bin"
libdir     = "/root/.cabal/lib/x86_64-linux-ghcjs-0.2.0-ghc8_0_1/transient-0.4.4-AB6V6OkRbjDLeWkpjk1RkP"
datadir    = "/root/.cabal/share/x86_64-linux-ghcjs-0.2.0-ghc8_0_1/transient-0.4.4"
libexecdir = "/root/.cabal/libexec"
sysconfdir = "/root/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "transient_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "transient_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "transient_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "transient_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "transient_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
