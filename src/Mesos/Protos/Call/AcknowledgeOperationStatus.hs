{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.Call.AcknowledgeOperationStatus (AcknowledgeOperationStatus(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.OperationID as Protos (OperationID)
import qualified Mesos.Protos.ResourceProviderID as Protos (ResourceProviderID)
import qualified Mesos.Protos.SlaveID as Protos (SlaveID)

data AcknowledgeOperationStatus = AcknowledgeOperationStatus{slave_id :: !(P'.Maybe Protos.SlaveID),
                                                             resource_provider_id :: !(P'.Maybe Protos.ResourceProviderID),
                                                             uuid :: !(P'.ByteString), operation_id :: !(Protos.OperationID)}
                                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                                            Prelude'.Generic)

instance P'.Mergeable AcknowledgeOperationStatus where
  mergeAppend (AcknowledgeOperationStatus x'1 x'2 x'3 x'4) (AcknowledgeOperationStatus y'1 y'2 y'3 y'4)
   = AcknowledgeOperationStatus (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default AcknowledgeOperationStatus where
  defaultValue = AcknowledgeOperationStatus P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire AcknowledgeOperationStatus where
  wireSize ft' self'@(AcknowledgeOperationStatus x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeReq 1 12 x'3 + P'.wireSizeReq 1 11 x'4)
  wirePutWithSize ft' self'@(AcknowledgeOperationStatus x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 11 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutReqWithSize 26 12 x'3,
             P'.wirePutReqWithSize 34 11 x'4]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{slave_id = P'.mergeAppend (slave_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{resource_provider_id = P'.mergeAppend (resource_provider_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{uuid = new'Field}) (P'.wireGet 12)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{operation_id = P'.mergeAppend (operation_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> AcknowledgeOperationStatus) AcknowledgeOperationStatus where
  getVal m' f' = f' m'

instance P'.GPB AcknowledgeOperationStatus

instance P'.ReflectDescriptor AcknowledgeOperationStatus where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [26, 34]) (P'.fromDistinctAscList [10, 18, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.scheduler.Call.AcknowledgeOperationStatus\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"AcknowledgeOperationStatus\"}, descFilePath = [\"Mesos\",\"Protos\",\"Call\",\"AcknowledgeOperationStatus.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.AcknowledgeOperationStatus.slave_id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"AcknowledgeOperationStatus\"], baseName' = FName \"slave_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.SlaveID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"SlaveID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.AcknowledgeOperationStatus.resource_provider_id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"AcknowledgeOperationStatus\"], baseName' = FName \"resource_provider_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.ResourceProviderID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"ResourceProviderID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.AcknowledgeOperationStatus.uuid\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"AcknowledgeOperationStatus\"], baseName' = FName \"uuid\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.AcknowledgeOperationStatus.operation_id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"AcknowledgeOperationStatus\"], baseName' = FName \"operation_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.OperationID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"OperationID\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType AcknowledgeOperationStatus where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg AcknowledgeOperationStatus where
  textPut msg
   = do
       P'.tellT "slave_id" (slave_id msg)
       P'.tellT "resource_provider_id" (resource_provider_id msg)
       P'.tellT "uuid" (uuid msg)
       P'.tellT "operation_id" (operation_id msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'slave_id, parse'resource_provider_id, parse'uuid, parse'operation_id]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'slave_id
         = P'.try
            (do
               v <- P'.getT "slave_id"
               Prelude'.return (\ o -> o{slave_id = v}))
        parse'resource_provider_id
         = P'.try
            (do
               v <- P'.getT "resource_provider_id"
               Prelude'.return (\ o -> o{resource_provider_id = v}))
        parse'uuid
         = P'.try
            (do
               v <- P'.getT "uuid"
               Prelude'.return (\ o -> o{uuid = v}))
        parse'operation_id
         = P'.try
            (do
               v <- P'.getT "operation_id"
               Prelude'.return (\ o -> o{operation_id = v}))