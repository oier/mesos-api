{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.Value.Ranges (Ranges(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.Value.Range as Protos.Value (Range)

data Ranges = Ranges{range :: !(P'.Seq Protos.Value.Range)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Ranges where
  mergeAppend (Ranges x'1) (Ranges y'1) = Ranges (P'.mergeAppend x'1 y'1)

instance P'.Default Ranges where
  defaultValue = Ranges P'.defaultValue

instance P'.Wire Ranges where
  wireSize ft' self'@(Ranges x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1)
  wirePutWithSize ft' self'@(Ranges x'1)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{range = P'.append (range old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Ranges) Ranges where
  getVal m' f' = f' m'

instance P'.GPB Ranges

instance P'.ReflectDescriptor Ranges where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.Value.Ranges\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Value\"], baseName = MName \"Ranges\"}, descFilePath = [\"Mesos\",\"Protos\",\"Value\",\"Ranges.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Value.Ranges.range\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Value\",MName \"Ranges\"], baseName' = FName \"range\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Value.Range\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Value\"], baseName = MName \"Range\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Ranges where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Ranges where
  textPut msg
   = do
       P'.tellT "range" (range msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'range]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'range
         = P'.try
            (do
               v <- P'.getT "range"
               Prelude'.return (\ o -> o{range = P'.append (range o) v}))