{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.Call.Shutdown (Shutdown(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.ExecutorID as Protos (ExecutorID)
import qualified Mesos.Protos.SlaveID as Protos (SlaveID)

data Shutdown = Shutdown{executor_id :: !(Protos.ExecutorID), slave_id :: !(Protos.SlaveID)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Shutdown where
  mergeAppend (Shutdown x'1 x'2) (Shutdown y'1 y'2) = Shutdown (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default Shutdown where
  defaultValue = Shutdown P'.defaultValue P'.defaultValue

instance P'.Wire Shutdown where
  wireSize ft' self'@(Shutdown x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 11 x'2)
  wirePutWithSize ft' self'@(Shutdown x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutReqWithSize 18 11 x'2]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{executor_id = P'.mergeAppend (executor_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{slave_id = P'.mergeAppend (slave_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Shutdown) Shutdown where
  getVal m' f' = f' m'

instance P'.GPB Shutdown

instance P'.ReflectDescriptor Shutdown where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.scheduler.Call.Shutdown\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Shutdown\"}, descFilePath = [\"Mesos\",\"Protos\",\"Call\",\"Shutdown.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.Shutdown.executor_id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Shutdown\"], baseName' = FName \"executor_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.ExecutorID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"ExecutorID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.Shutdown.slave_id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Shutdown\"], baseName' = FName \"slave_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.SlaveID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"SlaveID\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Shutdown where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Shutdown where
  textPut msg
   = do
       P'.tellT "executor_id" (executor_id msg)
       P'.tellT "slave_id" (slave_id msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'executor_id, parse'slave_id]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'executor_id
         = P'.try
            (do
               v <- P'.getT "executor_id"
               Prelude'.return (\ o -> o{executor_id = v}))
        parse'slave_id
         = P'.try
            (do
               v <- P'.getT "slave_id"
               Prelude'.return (\ o -> o{slave_id = v}))