{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.SlaveInfo (SlaveInfo(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.Attribute as Protos (Attribute)
import qualified Mesos.Protos.DomainInfo as Protos (DomainInfo)
import qualified Mesos.Protos.Resource as Protos (Resource)
import qualified Mesos.Protos.SlaveID as Protos (SlaveID)

data SlaveInfo = SlaveInfo{hostname :: !(P'.Utf8), port :: !(P'.Maybe P'.Int32), resources :: !(P'.Seq Protos.Resource),
                           attributes :: !(P'.Seq Protos.Attribute), id :: !(P'.Maybe Protos.SlaveID),
                           domain :: !(P'.Maybe Protos.DomainInfo), checkpoint :: !(P'.Maybe P'.Bool)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable SlaveInfo where
  mergeAppend (SlaveInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7) (SlaveInfo y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = SlaveInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)

instance P'.Default SlaveInfo where
  defaultValue
   = SlaveInfo P'.defaultValue (Prelude'.Just 5051) P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      (Prelude'.Just Prelude'.False)

instance P'.Wire SlaveInfo where
  wireSize ft' self'@(SlaveInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeOpt 1 5 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeRep 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 8 x'7)
  wirePutWithSize ft' self'@(SlaveInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutRepWithSize 26 11 x'3, P'.wirePutRepWithSize 42 11 x'4,
             P'.wirePutOptWithSize 50 11 x'5, P'.wirePutOptWithSize 56 8 x'7, P'.wirePutOptWithSize 64 5 x'2,
             P'.wirePutOptWithSize 82 11 x'6]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{hostname = new'Field}) (P'.wireGet 9)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{port = Prelude'.Just new'Field}) (P'.wireGet 5)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{resources = P'.append (resources old'Self) new'Field}) (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{attributes = P'.append (attributes old'Self) new'Field}) (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{id = P'.mergeAppend (id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{domain = P'.mergeAppend (domain old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{checkpoint = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> SlaveInfo) SlaveInfo where
  getVal m' f' = f' m'

instance P'.GPB SlaveInfo

instance P'.ReflectDescriptor SlaveInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 26, 42, 50, 56, 64, 82])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.SlaveInfo\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"SlaveInfo\"}, descFilePath = [\"Mesos\",\"Protos\",\"SlaveInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.SlaveInfo.hostname\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"SlaveInfo\"], baseName' = FName \"hostname\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.SlaveInfo.port\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"SlaveInfo\"], baseName' = FName \"port\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"5051\", hsDefault = Just (HsDef'Integer 5051)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.SlaveInfo.resources\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"SlaveInfo\"], baseName' = FName \"resources\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Resource\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.SlaveInfo.attributes\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"SlaveInfo\"], baseName' = FName \"attributes\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Attribute\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"Attribute\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.SlaveInfo.id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"SlaveInfo\"], baseName' = FName \"id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.SlaveID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"SlaveID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.SlaveInfo.domain\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"SlaveInfo\"], baseName' = FName \"domain\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.DomainInfo\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"DomainInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.SlaveInfo.checkpoint\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"SlaveInfo\"], baseName' = FName \"checkpoint\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType SlaveInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg SlaveInfo where
  textPut msg
   = do
       P'.tellT "hostname" (hostname msg)
       P'.tellT "port" (port msg)
       P'.tellT "resources" (resources msg)
       P'.tellT "attributes" (attributes msg)
       P'.tellT "id" (id msg)
       P'.tellT "domain" (domain msg)
       P'.tellT "checkpoint" (checkpoint msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'hostname, parse'port, parse'resources, parse'attributes, parse'id, parse'domain, parse'checkpoint])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'hostname
         = P'.try
            (do
               v <- P'.getT "hostname"
               Prelude'.return (\ o -> o{hostname = v}))
        parse'port
         = P'.try
            (do
               v <- P'.getT "port"
               Prelude'.return (\ o -> o{port = v}))
        parse'resources
         = P'.try
            (do
               v <- P'.getT "resources"
               Prelude'.return (\ o -> o{resources = P'.append (resources o) v}))
        parse'attributes
         = P'.try
            (do
               v <- P'.getT "attributes"
               Prelude'.return (\ o -> o{attributes = P'.append (attributes o) v}))
        parse'id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{id = v}))
        parse'domain
         = P'.try
            (do
               v <- P'.getT "domain"
               Prelude'.return (\ o -> o{domain = v}))
        parse'checkpoint
         = P'.try
            (do
               v <- P'.getT "checkpoint"
               Prelude'.return (\ o -> o{checkpoint = v}))