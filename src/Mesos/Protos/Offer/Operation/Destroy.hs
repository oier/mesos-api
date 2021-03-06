{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.Offer.Operation.Destroy (Destroy(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.Resource as Protos (Resource)

data Destroy = Destroy{volumes :: !(P'.Seq Protos.Resource)}
               deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Destroy where
  mergeAppend (Destroy x'1) (Destroy y'1) = Destroy (P'.mergeAppend x'1 y'1)

instance P'.Default Destroy where
  defaultValue = Destroy P'.defaultValue

instance P'.Wire Destroy where
  wireSize ft' self'@(Destroy x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1)
  wirePutWithSize ft' self'@(Destroy x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutRepWithSize 10 11 x'1]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{volumes = P'.append (volumes old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Destroy) Destroy where
  getVal m' f' = f' m'

instance P'.GPB Destroy

instance P'.ReflectDescriptor Destroy where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.Offer.Operation.Destroy\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"Destroy\"}, descFilePath = [\"Mesos\",\"Protos\",\"Offer\",\"Operation\",\"Destroy.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Offer.Operation.Destroy.volumes\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\",MName \"Destroy\"], baseName' = FName \"volumes\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Resource\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Destroy where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Destroy where
  textPut msg
   = do
       P'.tellT "volumes" (volumes msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'volumes]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'volumes
         = P'.try
            (do
               v <- P'.getT "volumes"
               Prelude'.return (\ o -> o{volumes = P'.append (volumes o) v}))