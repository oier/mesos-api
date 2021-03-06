{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.Volume.Source.SandboxPath.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | SELF
          | PARENT
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = PARENT

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just SELF
toMaybe'Enum 2 = Prelude'.Just PARENT
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum SELF = 1
  fromEnum PARENT = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.Protos.Volume.Source.SandboxPath.Type") .
      toMaybe'Enum
  succ UNKNOWN = SELF
  succ SELF = PARENT
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.Protos.Volume.Source.SandboxPath.Type"
  pred SELF = UNKNOWN
  pred PARENT = SELF
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.Protos.Volume.Source.SandboxPath.Type"

instance P'.Wire Type where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Type

instance P'.MessageAPI msg' (msg' -> Type) Type where
  getVal m' f' = f' m'

instance P'.ReflectEnum Type where
  reflectEnum = [(0, "UNKNOWN", UNKNOWN), (1, "SELF", SELF), (2, "PARENT", PARENT)]
  reflectEnumInfo _
   = P'.EnumInfo
      (P'.makePNF (P'.pack ".mesos.Volume.Source.SandboxPath.Type") ["Mesos"] ["Protos", "Volume", "Source", "SandboxPath"] "Type")
      ["Mesos", "Protos", "Volume", "Source", "SandboxPath", "Type.hs"]
      [(0, "UNKNOWN"), (1, "SELF"), (2, "PARENT")]

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead