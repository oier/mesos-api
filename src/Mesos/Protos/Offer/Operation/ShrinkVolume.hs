{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.Offer.Operation.ShrinkVolume (ShrinkVolume(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.Resource as Protos (Resource)
import qualified Mesos.Protos.Value.Scalar as Protos.Value (Scalar)

data ShrinkVolume = ShrinkVolume{volume :: !(Protos.Resource), subtract :: !(Protos.Value.Scalar)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable ShrinkVolume where
  mergeAppend (ShrinkVolume x'1 x'2) (ShrinkVolume y'1 y'2) = ShrinkVolume (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default ShrinkVolume where
  defaultValue = ShrinkVolume P'.defaultValue P'.defaultValue

instance P'.Wire ShrinkVolume where
  wireSize ft' self'@(ShrinkVolume x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 11 x'2)
  wirePutWithSize ft' self'@(ShrinkVolume x'1 x'2)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{volume = P'.mergeAppend (volume old'Self) (new'Field)}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{subtract = P'.mergeAppend (subtract old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ShrinkVolume) ShrinkVolume where
  getVal m' f' = f' m'

instance P'.GPB ShrinkVolume

instance P'.ReflectDescriptor ShrinkVolume where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.Offer.Operation.ShrinkVolume\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"ShrinkVolume\"}, descFilePath = [\"Mesos\",\"Protos\",\"Offer\",\"Operation\",\"ShrinkVolume.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Offer.Operation.ShrinkVolume.volume\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\",MName \"ShrinkVolume\"], baseName' = FName \"volume\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Resource\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Offer.Operation.ShrinkVolume.subtract\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\",MName \"ShrinkVolume\"], baseName' = FName \"subtract\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Value.Scalar\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Value\"], baseName = MName \"Scalar\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType ShrinkVolume where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ShrinkVolume where
  textPut msg
   = do
       P'.tellT "volume" (volume msg)
       P'.tellT "subtract" (subtract msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'volume, parse'subtract]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'volume
         = P'.try
            (do
               v <- P'.getT "volume"
               Prelude'.return (\ o -> o{volume = v}))
        parse'subtract
         = P'.try
            (do
               v <- P'.getT "subtract"
               Prelude'.return (\ o -> o{subtract = v}))