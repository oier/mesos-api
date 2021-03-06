{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.DiscoveryInfo.Visibility (Visibility(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Visibility = FRAMEWORK
                | CLUSTER
                | EXTERNAL
                  deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                            Prelude'.Generic)

instance P'.Mergeable Visibility

instance Prelude'.Bounded Visibility where
  minBound = FRAMEWORK
  maxBound = EXTERNAL

instance P'.Default Visibility where
  defaultValue = FRAMEWORK

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Visibility
toMaybe'Enum 0 = Prelude'.Just FRAMEWORK
toMaybe'Enum 1 = Prelude'.Just CLUSTER
toMaybe'Enum 2 = Prelude'.Just EXTERNAL
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Visibility where
  fromEnum FRAMEWORK = 0
  fromEnum CLUSTER = 1
  fromEnum EXTERNAL = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.Protos.DiscoveryInfo.Visibility") .
      toMaybe'Enum
  succ FRAMEWORK = CLUSTER
  succ CLUSTER = EXTERNAL
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.Protos.DiscoveryInfo.Visibility"
  pred CLUSTER = FRAMEWORK
  pred EXTERNAL = CLUSTER
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.Protos.DiscoveryInfo.Visibility"

instance P'.Wire Visibility where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Visibility

instance P'.MessageAPI msg' (msg' -> Visibility) Visibility where
  getVal m' f' = f' m'

instance P'.ReflectEnum Visibility where
  reflectEnum = [(0, "FRAMEWORK", FRAMEWORK), (1, "CLUSTER", CLUSTER), (2, "EXTERNAL", EXTERNAL)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.DiscoveryInfo.Visibility") ["Mesos"] ["Protos", "DiscoveryInfo"] "Visibility")
      ["Mesos", "Protos", "DiscoveryInfo", "Visibility.hs"]
      [(0, "FRAMEWORK"), (1, "CLUSTER"), (2, "EXTERNAL")]

instance P'.TextType Visibility where
  tellT = P'.tellShow
  getT = P'.getRead