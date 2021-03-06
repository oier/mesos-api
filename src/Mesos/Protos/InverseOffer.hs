{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.InverseOffer (InverseOffer(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.FrameworkID as Protos (FrameworkID)
import qualified Mesos.Protos.OfferID as Protos (OfferID)
import qualified Mesos.Protos.Resource as Protos (Resource)
import qualified Mesos.Protos.SlaveID as Protos (SlaveID)
import qualified Mesos.Protos.URL as Protos (URL)
import qualified Mesos.Protos.Unavailability as Protos (Unavailability)

data InverseOffer = InverseOffer{id :: !(Protos.OfferID), url :: !(P'.Maybe Protos.URL), framework_id :: !(Protos.FrameworkID),
                                 slave_id :: !(P'.Maybe Protos.SlaveID), unavailability :: !(Protos.Unavailability),
                                 resources :: !(P'.Seq Protos.Resource)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable InverseOffer where
  mergeAppend (InverseOffer x'1 x'2 x'3 x'4 x'5 x'6) (InverseOffer y'1 y'2 y'3 y'4 y'5 y'6)
   = InverseOffer (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)

instance P'.Default InverseOffer where
  defaultValue = InverseOffer P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire InverseOffer where
  wireSize ft' self'@(InverseOffer x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeReq 1 11 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeReq 1 11 x'5
             + P'.wireSizeRep 1 11 x'6)
  wirePutWithSize ft' self'@(InverseOffer x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutReqWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'4, P'.wirePutReqWithSize 42 11 x'5, P'.wirePutRepWithSize 50 11 x'6]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{id = P'.mergeAppend (id old'Self) (new'Field)}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{url = P'.mergeAppend (url old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{framework_id = P'.mergeAppend (framework_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{slave_id = P'.mergeAppend (slave_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{unavailability = P'.mergeAppend (unavailability old'Self) (new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{resources = P'.append (resources old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> InverseOffer) InverseOffer where
  getVal m' f' = f' m'

instance P'.GPB InverseOffer

instance P'.ReflectDescriptor InverseOffer where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 26, 42]) (P'.fromDistinctAscList [10, 18, 26, 34, 42, 50])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.InverseOffer\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"InverseOffer\"}, descFilePath = [\"Mesos\",\"Protos\",\"InverseOffer.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.InverseOffer.id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"InverseOffer\"], baseName' = FName \"id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.OfferID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"OfferID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.InverseOffer.url\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"InverseOffer\"], baseName' = FName \"url\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.URL\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"URL\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.InverseOffer.framework_id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"InverseOffer\"], baseName' = FName \"framework_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.FrameworkID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.InverseOffer.slave_id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"InverseOffer\"], baseName' = FName \"slave_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.SlaveID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"SlaveID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.InverseOffer.unavailability\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"InverseOffer\"], baseName' = FName \"unavailability\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Unavailability\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"Unavailability\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.InverseOffer.resources\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"InverseOffer\"], baseName' = FName \"resources\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Resource\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType InverseOffer where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg InverseOffer where
  textPut msg
   = do
       P'.tellT "id" (id msg)
       P'.tellT "url" (url msg)
       P'.tellT "framework_id" (framework_id msg)
       P'.tellT "slave_id" (slave_id msg)
       P'.tellT "unavailability" (unavailability msg)
       P'.tellT "resources" (resources msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice [parse'id, parse'url, parse'framework_id, parse'slave_id, parse'unavailability, parse'resources])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{id = v}))
        parse'url
         = P'.try
            (do
               v <- P'.getT "url"
               Prelude'.return (\ o -> o{url = v}))
        parse'framework_id
         = P'.try
            (do
               v <- P'.getT "framework_id"
               Prelude'.return (\ o -> o{framework_id = v}))
        parse'slave_id
         = P'.try
            (do
               v <- P'.getT "slave_id"
               Prelude'.return (\ o -> o{slave_id = v}))
        parse'unavailability
         = P'.try
            (do
               v <- P'.getT "unavailability"
               Prelude'.return (\ o -> o{unavailability = v}))
        parse'resources
         = P'.try
            (do
               v <- P'.getT "resources"
               Prelude'.return (\ o -> o{resources = P'.append (resources o) v}))