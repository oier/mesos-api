{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.Call.Subscribe (Subscribe(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.FrameworkInfo as Protos (FrameworkInfo)

data Subscribe = Subscribe{framework_info :: !(Protos.FrameworkInfo), force :: !(P'.Maybe P'.Bool),
                           suppressed_roles :: !(P'.Seq P'.Utf8)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Subscribe where
  mergeAppend (Subscribe x'1 x'2 x'3) (Subscribe y'1 y'2 y'3)
   = Subscribe (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default Subscribe where
  defaultValue = Subscribe P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Subscribe where
  wireSize ft' self'@(Subscribe x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeOpt 1 8 x'2 + P'.wireSizeRep 1 9 x'3)
  wirePutWithSize ft' self'@(Subscribe x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutOptWithSize 16 8 x'2, P'.wirePutRepWithSize 26 9 x'3]
        put'FieldsSized
         = let size' = Prelude'.fst (P'.runPutM put'Fields)
               put'Size
                = do
                    P'.putSize size'
                    Prelude'.return (P'.size'WireSize size')
            in P'.sequencePutWithSize [put'Size, put'Fields]
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{framework_info = P'.mergeAppend (framework_info old'Self) (new'Field)})
                    (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{force = Prelude'.Just new'Field}) (P'.wireGet 8)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{suppressed_roles = P'.append (suppressed_roles old'Self) new'Field})
                    (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Subscribe) Subscribe where
  getVal m' f' = f' m'

instance P'.GPB Subscribe

instance P'.ReflectDescriptor Subscribe where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 16, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.scheduler.Call.Subscribe\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Subscribe\"}, descFilePath = [\"Mesos\",\"Protos\",\"Call\",\"Subscribe.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.Subscribe.framework_info\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Subscribe\"], baseName' = FName \"framework_info\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.FrameworkInfo\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.Subscribe.force\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Subscribe\"], baseName' = FName \"force\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.Subscribe.suppressed_roles\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Subscribe\"], baseName' = FName \"suppressed_roles\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Subscribe where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Subscribe where
  textPut msg
   = do
       P'.tellT "framework_info" (framework_info msg)
       P'.tellT "force" (force msg)
       P'.tellT "suppressed_roles" (suppressed_roles msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'framework_info, parse'force, parse'suppressed_roles]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'framework_info
         = P'.try
            (do
               v <- P'.getT "framework_info"
               Prelude'.return (\ o -> o{framework_info = v}))
        parse'force
         = P'.try
            (do
               v <- P'.getT "force"
               Prelude'.return (\ o -> o{force = v}))
        parse'suppressed_roles
         = P'.try
            (do
               v <- P'.getT "suppressed_roles"
               Prelude'.return (\ o -> o{suppressed_roles = P'.append (suppressed_roles o) v}))