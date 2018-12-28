{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.Operation (Operation(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.FrameworkID as Protos (FrameworkID)
import qualified Mesos.Protos.Offer.Operation as Protos.Offer (Operation)
import qualified Mesos.Protos.OperationStatus as Protos (OperationStatus)
import qualified Mesos.Protos.SlaveID as Protos (SlaveID)
import qualified Mesos.Protos.UUID as Protos (UUID)

data Operation = Operation{framework_id :: !(P'.Maybe Protos.FrameworkID), slave_id :: !(P'.Maybe Protos.SlaveID),
                           info :: !(Protos.Offer.Operation), latest_status :: !(Protos.OperationStatus),
                           statuses :: !(P'.Seq Protos.OperationStatus), uuid :: !(Protos.UUID)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Operation where
  mergeAppend (Operation x'1 x'2 x'3 x'4 x'5 x'6) (Operation y'1 y'2 y'3 y'4 y'5 y'6)
   = Operation (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)

instance P'.Default Operation where
  defaultValue = Operation P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Operation where
  wireSize ft' self'@(Operation x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeReq 1 11 x'3 + P'.wireSizeReq 1 11 x'4 +
             P'.wireSizeRep 1 11 x'5
             + P'.wireSizeReq 1 11 x'6)
  wirePutWithSize ft' self'@(Operation x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 11 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutReqWithSize 26 11 x'3,
             P'.wirePutReqWithSize 34 11 x'4, P'.wirePutRepWithSize 42 11 x'5, P'.wirePutReqWithSize 50 11 x'6]
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
             10 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{framework_id = P'.mergeAppend (framework_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{slave_id = P'.mergeAppend (slave_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{info = P'.mergeAppend (info old'Self) (new'Field)}) (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{latest_status = P'.mergeAppend (latest_status old'Self) (new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{statuses = P'.append (statuses old'Self) new'Field}) (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{uuid = P'.mergeAppend (uuid old'Self) (new'Field)}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Operation) Operation where
  getVal m' f' = f' m'

instance P'.GPB Operation

instance P'.ReflectDescriptor Operation where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [26, 34, 50]) (P'.fromDistinctAscList [10, 18, 26, 34, 42, 50])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.Operation\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"Operation\"}, descFilePath = [\"Mesos\",\"Protos\",\"Operation.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Operation.framework_id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Operation\"], baseName' = FName \"framework_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.FrameworkID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Operation.slave_id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Operation\"], baseName' = FName \"slave_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.SlaveID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"SlaveID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Operation.info\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Operation\"], baseName' = FName \"info\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Offer.Operation\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Offer\"], baseName = MName \"Operation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Operation.latest_status\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Operation\"], baseName' = FName \"latest_status\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.OperationStatus\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"OperationStatus\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Operation.statuses\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Operation\"], baseName' = FName \"statuses\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.OperationStatus\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"OperationStatus\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Operation.uuid\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Operation\"], baseName' = FName \"uuid\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.UUID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"UUID\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Operation where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Operation where
  textPut msg
   = do
       P'.tellT "framework_id" (framework_id msg)
       P'.tellT "slave_id" (slave_id msg)
       P'.tellT "info" (info msg)
       P'.tellT "latest_status" (latest_status msg)
       P'.tellT "statuses" (statuses msg)
       P'.tellT "uuid" (uuid msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice [parse'framework_id, parse'slave_id, parse'info, parse'latest_status, parse'statuses, parse'uuid])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
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
        parse'info
         = P'.try
            (do
               v <- P'.getT "info"
               Prelude'.return (\ o -> o{info = v}))
        parse'latest_status
         = P'.try
            (do
               v <- P'.getT "latest_status"
               Prelude'.return (\ o -> o{latest_status = v}))
        parse'statuses
         = P'.try
            (do
               v <- P'.getT "statuses"
               Prelude'.return (\ o -> o{statuses = P'.append (statuses o) v}))
        parse'uuid
         = P'.try
            (do
               v <- P'.getT "uuid"
               Prelude'.return (\ o -> o{uuid = v}))