module Example.Hooks.UseInitializer
  ( useInitializer
  , UseInitializer
  )
  where

import Prelude

import Data.Maybe (Maybe(..))
import Halogen.Hooks (class HookNewtype, Hook, HookM, UseEffect, kind HookType)
import Halogen.Hooks as Hooks

foreign import data UseInitializer :: HookType

instance hookUseInitializer :: HookNewtype UseInitializer UseEffect

useInitializer :: forall m. HookM m Unit -> Hook m UseInitializer Unit
useInitializer initializer = Hooks.wrap do
  Hooks.useLifecycleEffect (initializer *> pure Nothing)
