{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.HealthCheck (HealthCheck(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.CommandInfo as Protos (CommandInfo)
import qualified Mesos.Protos.HealthCheck.HTTPCheckInfo as Protos.HealthCheck (HTTPCheckInfo)
import qualified Mesos.Protos.HealthCheck.TCPCheckInfo as Protos.HealthCheck (TCPCheckInfo)
import qualified Mesos.Protos.HealthCheck.Type as Protos.HealthCheck (Type)

data HealthCheck = HealthCheck{delay_seconds :: !(P'.Maybe P'.Double), interval_seconds :: !(P'.Maybe P'.Double),
                               timeout_seconds :: !(P'.Maybe P'.Double), consecutive_failures :: !(P'.Maybe P'.Word32),
                               grace_period_seconds :: !(P'.Maybe P'.Double), type' :: !(P'.Maybe Protos.HealthCheck.Type),
                               command :: !(P'.Maybe Protos.CommandInfo), http :: !(P'.Maybe Protos.HealthCheck.HTTPCheckInfo),
                               tcp :: !(P'.Maybe Protos.HealthCheck.TCPCheckInfo)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable HealthCheck where
  mergeAppend (HealthCheck x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9) (HealthCheck y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9)
   = HealthCheck (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)

instance P'.Default HealthCheck where
  defaultValue
   = HealthCheck (Prelude'.Just 15.0) (Prelude'.Just 10.0) (Prelude'.Just 20.0) (Prelude'.Just 3) (Prelude'.Just 10.0)
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire HealthCheck where
  wireSize ft' self'@(HealthCheck x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 1 x'1 + P'.wireSizeOpt 1 1 x'2 + P'.wireSizeOpt 1 1 x'3 + P'.wireSizeOpt 1 13 x'4 +
             P'.wireSizeOpt 1 1 x'5
             + P'.wireSizeOpt 1 14 x'6
             + P'.wireSizeOpt 1 11 x'7
             + P'.wireSizeOpt 1 11 x'8
             + P'.wireSizeOpt 1 11 x'9)
  wirePutWithSize ft' self'@(HealthCheck x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 11 x'8, P'.wirePutOptWithSize 17 1 x'1, P'.wirePutOptWithSize 25 1 x'2,
             P'.wirePutOptWithSize 33 1 x'3, P'.wirePutOptWithSize 40 13 x'4, P'.wirePutOptWithSize 49 1 x'5,
             P'.wirePutOptWithSize 58 11 x'7, P'.wirePutOptWithSize 64 14 x'6, P'.wirePutOptWithSize 74 11 x'9]
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
             17 -> Prelude'.fmap (\ !new'Field -> old'Self{delay_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             25 -> Prelude'.fmap (\ !new'Field -> old'Self{interval_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             33 -> Prelude'.fmap (\ !new'Field -> old'Self{timeout_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{consecutive_failures = Prelude'.Just new'Field}) (P'.wireGet 13)
             49 -> Prelude'.fmap (\ !new'Field -> old'Self{grace_period_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{command = P'.mergeAppend (command old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{http = P'.mergeAppend (http old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{tcp = P'.mergeAppend (tcp old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> HealthCheck) HealthCheck where
  getVal m' f' = f' m'

instance P'.GPB HealthCheck

instance P'.ReflectDescriptor HealthCheck where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 17, 25, 33, 40, 49, 58, 64, 74])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.HealthCheck\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"HealthCheck\"}, descFilePath = [\"Mesos\",\"Protos\",\"HealthCheck.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.HealthCheck.delay_seconds\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"delay_seconds\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"15.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (15 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.HealthCheck.interval_seconds\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"interval_seconds\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 25}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"10.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (10 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.HealthCheck.timeout_seconds\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"timeout_seconds\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 33}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"20.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (20 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.HealthCheck.consecutive_failures\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"consecutive_failures\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"3\", hsDefault = Just (HsDef'Integer 3)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.HealthCheck.grace_period_seconds\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"grace_period_seconds\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 49}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"10.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (10 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.HealthCheck.type\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"type'\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.HealthCheck.Type\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"HealthCheck\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.HealthCheck.command\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"command\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.CommandInfo\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"CommandInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.HealthCheck.http\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"http\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.HealthCheck.HTTPCheckInfo\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"HealthCheck\"], baseName = MName \"HTTPCheckInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.HealthCheck.tcp\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"tcp\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.HealthCheck.TCPCheckInfo\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"HealthCheck\"], baseName = MName \"TCPCheckInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType HealthCheck where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg HealthCheck where
  textPut msg
   = do
       P'.tellT "delay_seconds" (delay_seconds msg)
       P'.tellT "interval_seconds" (interval_seconds msg)
       P'.tellT "timeout_seconds" (timeout_seconds msg)
       P'.tellT "consecutive_failures" (consecutive_failures msg)
       P'.tellT "grace_period_seconds" (grace_period_seconds msg)
       P'.tellT "type" (type' msg)
       P'.tellT "command" (command msg)
       P'.tellT "http" (http msg)
       P'.tellT "tcp" (tcp msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'delay_seconds, parse'interval_seconds, parse'timeout_seconds, parse'consecutive_failures,
                   parse'grace_period_seconds, parse'type', parse'command, parse'http, parse'tcp])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'delay_seconds
         = P'.try
            (do
               v <- P'.getT "delay_seconds"
               Prelude'.return (\ o -> o{delay_seconds = v}))
        parse'interval_seconds
         = P'.try
            (do
               v <- P'.getT "interval_seconds"
               Prelude'.return (\ o -> o{interval_seconds = v}))
        parse'timeout_seconds
         = P'.try
            (do
               v <- P'.getT "timeout_seconds"
               Prelude'.return (\ o -> o{timeout_seconds = v}))
        parse'consecutive_failures
         = P'.try
            (do
               v <- P'.getT "consecutive_failures"
               Prelude'.return (\ o -> o{consecutive_failures = v}))
        parse'grace_period_seconds
         = P'.try
            (do
               v <- P'.getT "grace_period_seconds"
               Prelude'.return (\ o -> o{grace_period_seconds = v}))
        parse'type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{type' = v}))
        parse'command
         = P'.try
            (do
               v <- P'.getT "command"
               Prelude'.return (\ o -> o{command = v}))
        parse'http
         = P'.try
            (do
               v <- P'.getT "http"
               Prelude'.return (\ o -> o{http = v}))
        parse'tcp
         = P'.try
            (do
               v <- P'.getT "tcp"
               Prelude'.return (\ o -> o{tcp = v}))