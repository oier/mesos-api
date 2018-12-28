{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.TaskStatus.Reason (Reason(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Reason = REASON_COMMAND_EXECUTOR_FAILED
            | REASON_CONTAINER_LAUNCH_FAILED
            | REASON_CONTAINER_LIMITATION
            | REASON_CONTAINER_LIMITATION_DISK
            | REASON_CONTAINER_LIMITATION_MEMORY
            | REASON_CONTAINER_PREEMPTED
            | REASON_CONTAINER_UPDATE_FAILED
            | REASON_MAX_COMPLETION_TIME_REACHED
            | REASON_EXECUTOR_REGISTRATION_TIMEOUT
            | REASON_EXECUTOR_REREGISTRATION_TIMEOUT
            | REASON_EXECUTOR_TERMINATED
            | REASON_EXECUTOR_UNREGISTERED
            | REASON_FRAMEWORK_REMOVED
            | REASON_GC_ERROR
            | REASON_INVALID_FRAMEWORKID
            | REASON_INVALID_OFFERS
            | REASON_IO_SWITCHBOARD_EXITED
            | REASON_MASTER_DISCONNECTED
            | REASON_RECONCILIATION
            | REASON_RESOURCES_UNKNOWN
            | REASON_SLAVE_DISCONNECTED
            | REASON_SLAVE_REMOVED
            | REASON_SLAVE_REMOVED_BY_OPERATOR
            | REASON_SLAVE_REREGISTERED
            | REASON_SLAVE_RESTARTED
            | REASON_SLAVE_UNKNOWN
            | REASON_TASK_KILLED_DURING_LAUNCH
            | REASON_TASK_CHECK_STATUS_UPDATED
            | REASON_TASK_HEALTH_CHECK_STATUS_UPDATED
            | REASON_TASK_GROUP_INVALID
            | REASON_TASK_GROUP_UNAUTHORIZED
            | REASON_TASK_INVALID
            | REASON_TASK_UNAUTHORIZED
            | REASON_TASK_UNKNOWN
              deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Reason

instance Prelude'.Bounded Reason where
  minBound = REASON_COMMAND_EXECUTOR_FAILED
  maxBound = REASON_TASK_UNKNOWN

instance P'.Default Reason where
  defaultValue = REASON_COMMAND_EXECUTOR_FAILED

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Reason
toMaybe'Enum 0 = Prelude'.Just REASON_COMMAND_EXECUTOR_FAILED
toMaybe'Enum 21 = Prelude'.Just REASON_CONTAINER_LAUNCH_FAILED
toMaybe'Enum 19 = Prelude'.Just REASON_CONTAINER_LIMITATION
toMaybe'Enum 20 = Prelude'.Just REASON_CONTAINER_LIMITATION_DISK
toMaybe'Enum 8 = Prelude'.Just REASON_CONTAINER_LIMITATION_MEMORY
toMaybe'Enum 17 = Prelude'.Just REASON_CONTAINER_PREEMPTED
toMaybe'Enum 22 = Prelude'.Just REASON_CONTAINER_UPDATE_FAILED
toMaybe'Enum 33 = Prelude'.Just REASON_MAX_COMPLETION_TIME_REACHED
toMaybe'Enum 23 = Prelude'.Just REASON_EXECUTOR_REGISTRATION_TIMEOUT
toMaybe'Enum 24 = Prelude'.Just REASON_EXECUTOR_REREGISTRATION_TIMEOUT
toMaybe'Enum 1 = Prelude'.Just REASON_EXECUTOR_TERMINATED
toMaybe'Enum 2 = Prelude'.Just REASON_EXECUTOR_UNREGISTERED
toMaybe'Enum 3 = Prelude'.Just REASON_FRAMEWORK_REMOVED
toMaybe'Enum 4 = Prelude'.Just REASON_GC_ERROR
toMaybe'Enum 5 = Prelude'.Just REASON_INVALID_FRAMEWORKID
toMaybe'Enum 6 = Prelude'.Just REASON_INVALID_OFFERS
toMaybe'Enum 27 = Prelude'.Just REASON_IO_SWITCHBOARD_EXITED
toMaybe'Enum 7 = Prelude'.Just REASON_MASTER_DISCONNECTED
toMaybe'Enum 9 = Prelude'.Just REASON_RECONCILIATION
toMaybe'Enum 18 = Prelude'.Just REASON_RESOURCES_UNKNOWN
toMaybe'Enum 10 = Prelude'.Just REASON_SLAVE_DISCONNECTED
toMaybe'Enum 11 = Prelude'.Just REASON_SLAVE_REMOVED
toMaybe'Enum 31 = Prelude'.Just REASON_SLAVE_REMOVED_BY_OPERATOR
toMaybe'Enum 32 = Prelude'.Just REASON_SLAVE_REREGISTERED
toMaybe'Enum 12 = Prelude'.Just REASON_SLAVE_RESTARTED
toMaybe'Enum 13 = Prelude'.Just REASON_SLAVE_UNKNOWN
toMaybe'Enum 30 = Prelude'.Just REASON_TASK_KILLED_DURING_LAUNCH
toMaybe'Enum 28 = Prelude'.Just REASON_TASK_CHECK_STATUS_UPDATED
toMaybe'Enum 29 = Prelude'.Just REASON_TASK_HEALTH_CHECK_STATUS_UPDATED
toMaybe'Enum 25 = Prelude'.Just REASON_TASK_GROUP_INVALID
toMaybe'Enum 26 = Prelude'.Just REASON_TASK_GROUP_UNAUTHORIZED
toMaybe'Enum 14 = Prelude'.Just REASON_TASK_INVALID
toMaybe'Enum 15 = Prelude'.Just REASON_TASK_UNAUTHORIZED
toMaybe'Enum 16 = Prelude'.Just REASON_TASK_UNKNOWN
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Reason where
  fromEnum REASON_COMMAND_EXECUTOR_FAILED = 0
  fromEnum REASON_CONTAINER_LAUNCH_FAILED = 21
  fromEnum REASON_CONTAINER_LIMITATION = 19
  fromEnum REASON_CONTAINER_LIMITATION_DISK = 20
  fromEnum REASON_CONTAINER_LIMITATION_MEMORY = 8
  fromEnum REASON_CONTAINER_PREEMPTED = 17
  fromEnum REASON_CONTAINER_UPDATE_FAILED = 22
  fromEnum REASON_MAX_COMPLETION_TIME_REACHED = 33
  fromEnum REASON_EXECUTOR_REGISTRATION_TIMEOUT = 23
  fromEnum REASON_EXECUTOR_REREGISTRATION_TIMEOUT = 24
  fromEnum REASON_EXECUTOR_TERMINATED = 1
  fromEnum REASON_EXECUTOR_UNREGISTERED = 2
  fromEnum REASON_FRAMEWORK_REMOVED = 3
  fromEnum REASON_GC_ERROR = 4
  fromEnum REASON_INVALID_FRAMEWORKID = 5
  fromEnum REASON_INVALID_OFFERS = 6
  fromEnum REASON_IO_SWITCHBOARD_EXITED = 27
  fromEnum REASON_MASTER_DISCONNECTED = 7
  fromEnum REASON_RECONCILIATION = 9
  fromEnum REASON_RESOURCES_UNKNOWN = 18
  fromEnum REASON_SLAVE_DISCONNECTED = 10
  fromEnum REASON_SLAVE_REMOVED = 11
  fromEnum REASON_SLAVE_REMOVED_BY_OPERATOR = 31
  fromEnum REASON_SLAVE_REREGISTERED = 32
  fromEnum REASON_SLAVE_RESTARTED = 12
  fromEnum REASON_SLAVE_UNKNOWN = 13
  fromEnum REASON_TASK_KILLED_DURING_LAUNCH = 30
  fromEnum REASON_TASK_CHECK_STATUS_UPDATED = 28
  fromEnum REASON_TASK_HEALTH_CHECK_STATUS_UPDATED = 29
  fromEnum REASON_TASK_GROUP_INVALID = 25
  fromEnum REASON_TASK_GROUP_UNAUTHORIZED = 26
  fromEnum REASON_TASK_INVALID = 14
  fromEnum REASON_TASK_UNAUTHORIZED = 15
  fromEnum REASON_TASK_UNKNOWN = 16
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.Protos.TaskStatus.Reason") . toMaybe'Enum
  succ REASON_COMMAND_EXECUTOR_FAILED = REASON_CONTAINER_LAUNCH_FAILED
  succ REASON_CONTAINER_LAUNCH_FAILED = REASON_CONTAINER_LIMITATION
  succ REASON_CONTAINER_LIMITATION = REASON_CONTAINER_LIMITATION_DISK
  succ REASON_CONTAINER_LIMITATION_DISK = REASON_CONTAINER_LIMITATION_MEMORY
  succ REASON_CONTAINER_LIMITATION_MEMORY = REASON_CONTAINER_PREEMPTED
  succ REASON_CONTAINER_PREEMPTED = REASON_CONTAINER_UPDATE_FAILED
  succ REASON_CONTAINER_UPDATE_FAILED = REASON_MAX_COMPLETION_TIME_REACHED
  succ REASON_MAX_COMPLETION_TIME_REACHED = REASON_EXECUTOR_REGISTRATION_TIMEOUT
  succ REASON_EXECUTOR_REGISTRATION_TIMEOUT = REASON_EXECUTOR_REREGISTRATION_TIMEOUT
  succ REASON_EXECUTOR_REREGISTRATION_TIMEOUT = REASON_EXECUTOR_TERMINATED
  succ REASON_EXECUTOR_TERMINATED = REASON_EXECUTOR_UNREGISTERED
  succ REASON_EXECUTOR_UNREGISTERED = REASON_FRAMEWORK_REMOVED
  succ REASON_FRAMEWORK_REMOVED = REASON_GC_ERROR
  succ REASON_GC_ERROR = REASON_INVALID_FRAMEWORKID
  succ REASON_INVALID_FRAMEWORKID = REASON_INVALID_OFFERS
  succ REASON_INVALID_OFFERS = REASON_IO_SWITCHBOARD_EXITED
  succ REASON_IO_SWITCHBOARD_EXITED = REASON_MASTER_DISCONNECTED
  succ REASON_MASTER_DISCONNECTED = REASON_RECONCILIATION
  succ REASON_RECONCILIATION = REASON_RESOURCES_UNKNOWN
  succ REASON_RESOURCES_UNKNOWN = REASON_SLAVE_DISCONNECTED
  succ REASON_SLAVE_DISCONNECTED = REASON_SLAVE_REMOVED
  succ REASON_SLAVE_REMOVED = REASON_SLAVE_REMOVED_BY_OPERATOR
  succ REASON_SLAVE_REMOVED_BY_OPERATOR = REASON_SLAVE_REREGISTERED
  succ REASON_SLAVE_REREGISTERED = REASON_SLAVE_RESTARTED
  succ REASON_SLAVE_RESTARTED = REASON_SLAVE_UNKNOWN
  succ REASON_SLAVE_UNKNOWN = REASON_TASK_KILLED_DURING_LAUNCH
  succ REASON_TASK_KILLED_DURING_LAUNCH = REASON_TASK_CHECK_STATUS_UPDATED
  succ REASON_TASK_CHECK_STATUS_UPDATED = REASON_TASK_HEALTH_CHECK_STATUS_UPDATED
  succ REASON_TASK_HEALTH_CHECK_STATUS_UPDATED = REASON_TASK_GROUP_INVALID
  succ REASON_TASK_GROUP_INVALID = REASON_TASK_GROUP_UNAUTHORIZED
  succ REASON_TASK_GROUP_UNAUTHORIZED = REASON_TASK_INVALID
  succ REASON_TASK_INVALID = REASON_TASK_UNAUTHORIZED
  succ REASON_TASK_UNAUTHORIZED = REASON_TASK_UNKNOWN
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.Protos.TaskStatus.Reason"
  pred REASON_CONTAINER_LAUNCH_FAILED = REASON_COMMAND_EXECUTOR_FAILED
  pred REASON_CONTAINER_LIMITATION = REASON_CONTAINER_LAUNCH_FAILED
  pred REASON_CONTAINER_LIMITATION_DISK = REASON_CONTAINER_LIMITATION
  pred REASON_CONTAINER_LIMITATION_MEMORY = REASON_CONTAINER_LIMITATION_DISK
  pred REASON_CONTAINER_PREEMPTED = REASON_CONTAINER_LIMITATION_MEMORY
  pred REASON_CONTAINER_UPDATE_FAILED = REASON_CONTAINER_PREEMPTED
  pred REASON_MAX_COMPLETION_TIME_REACHED = REASON_CONTAINER_UPDATE_FAILED
  pred REASON_EXECUTOR_REGISTRATION_TIMEOUT = REASON_MAX_COMPLETION_TIME_REACHED
  pred REASON_EXECUTOR_REREGISTRATION_TIMEOUT = REASON_EXECUTOR_REGISTRATION_TIMEOUT
  pred REASON_EXECUTOR_TERMINATED = REASON_EXECUTOR_REREGISTRATION_TIMEOUT
  pred REASON_EXECUTOR_UNREGISTERED = REASON_EXECUTOR_TERMINATED
  pred REASON_FRAMEWORK_REMOVED = REASON_EXECUTOR_UNREGISTERED
  pred REASON_GC_ERROR = REASON_FRAMEWORK_REMOVED
  pred REASON_INVALID_FRAMEWORKID = REASON_GC_ERROR
  pred REASON_INVALID_OFFERS = REASON_INVALID_FRAMEWORKID
  pred REASON_IO_SWITCHBOARD_EXITED = REASON_INVALID_OFFERS
  pred REASON_MASTER_DISCONNECTED = REASON_IO_SWITCHBOARD_EXITED
  pred REASON_RECONCILIATION = REASON_MASTER_DISCONNECTED
  pred REASON_RESOURCES_UNKNOWN = REASON_RECONCILIATION
  pred REASON_SLAVE_DISCONNECTED = REASON_RESOURCES_UNKNOWN
  pred REASON_SLAVE_REMOVED = REASON_SLAVE_DISCONNECTED
  pred REASON_SLAVE_REMOVED_BY_OPERATOR = REASON_SLAVE_REMOVED
  pred REASON_SLAVE_REREGISTERED = REASON_SLAVE_REMOVED_BY_OPERATOR
  pred REASON_SLAVE_RESTARTED = REASON_SLAVE_REREGISTERED
  pred REASON_SLAVE_UNKNOWN = REASON_SLAVE_RESTARTED
  pred REASON_TASK_KILLED_DURING_LAUNCH = REASON_SLAVE_UNKNOWN
  pred REASON_TASK_CHECK_STATUS_UPDATED = REASON_TASK_KILLED_DURING_LAUNCH
  pred REASON_TASK_HEALTH_CHECK_STATUS_UPDATED = REASON_TASK_CHECK_STATUS_UPDATED
  pred REASON_TASK_GROUP_INVALID = REASON_TASK_HEALTH_CHECK_STATUS_UPDATED
  pred REASON_TASK_GROUP_UNAUTHORIZED = REASON_TASK_GROUP_INVALID
  pred REASON_TASK_INVALID = REASON_TASK_GROUP_UNAUTHORIZED
  pred REASON_TASK_UNAUTHORIZED = REASON_TASK_INVALID
  pred REASON_TASK_UNKNOWN = REASON_TASK_UNAUTHORIZED
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.Protos.TaskStatus.Reason"

instance P'.Wire Reason where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Reason

instance P'.MessageAPI msg' (msg' -> Reason) Reason where
  getVal m' f' = f' m'

instance P'.ReflectEnum Reason where
  reflectEnum
   = [(0, "REASON_COMMAND_EXECUTOR_FAILED", REASON_COMMAND_EXECUTOR_FAILED),
      (21, "REASON_CONTAINER_LAUNCH_FAILED", REASON_CONTAINER_LAUNCH_FAILED),
      (19, "REASON_CONTAINER_LIMITATION", REASON_CONTAINER_LIMITATION),
      (20, "REASON_CONTAINER_LIMITATION_DISK", REASON_CONTAINER_LIMITATION_DISK),
      (8, "REASON_CONTAINER_LIMITATION_MEMORY", REASON_CONTAINER_LIMITATION_MEMORY),
      (17, "REASON_CONTAINER_PREEMPTED", REASON_CONTAINER_PREEMPTED),
      (22, "REASON_CONTAINER_UPDATE_FAILED", REASON_CONTAINER_UPDATE_FAILED),
      (33, "REASON_MAX_COMPLETION_TIME_REACHED", REASON_MAX_COMPLETION_TIME_REACHED),
      (23, "REASON_EXECUTOR_REGISTRATION_TIMEOUT", REASON_EXECUTOR_REGISTRATION_TIMEOUT),
      (24, "REASON_EXECUTOR_REREGISTRATION_TIMEOUT", REASON_EXECUTOR_REREGISTRATION_TIMEOUT),
      (1, "REASON_EXECUTOR_TERMINATED", REASON_EXECUTOR_TERMINATED),
      (2, "REASON_EXECUTOR_UNREGISTERED", REASON_EXECUTOR_UNREGISTERED), (3, "REASON_FRAMEWORK_REMOVED", REASON_FRAMEWORK_REMOVED),
      (4, "REASON_GC_ERROR", REASON_GC_ERROR), (5, "REASON_INVALID_FRAMEWORKID", REASON_INVALID_FRAMEWORKID),
      (6, "REASON_INVALID_OFFERS", REASON_INVALID_OFFERS), (27, "REASON_IO_SWITCHBOARD_EXITED", REASON_IO_SWITCHBOARD_EXITED),
      (7, "REASON_MASTER_DISCONNECTED", REASON_MASTER_DISCONNECTED), (9, "REASON_RECONCILIATION", REASON_RECONCILIATION),
      (18, "REASON_RESOURCES_UNKNOWN", REASON_RESOURCES_UNKNOWN), (10, "REASON_SLAVE_DISCONNECTED", REASON_SLAVE_DISCONNECTED),
      (11, "REASON_SLAVE_REMOVED", REASON_SLAVE_REMOVED),
      (31, "REASON_SLAVE_REMOVED_BY_OPERATOR", REASON_SLAVE_REMOVED_BY_OPERATOR),
      (32, "REASON_SLAVE_REREGISTERED", REASON_SLAVE_REREGISTERED), (12, "REASON_SLAVE_RESTARTED", REASON_SLAVE_RESTARTED),
      (13, "REASON_SLAVE_UNKNOWN", REASON_SLAVE_UNKNOWN),
      (30, "REASON_TASK_KILLED_DURING_LAUNCH", REASON_TASK_KILLED_DURING_LAUNCH),
      (28, "REASON_TASK_CHECK_STATUS_UPDATED", REASON_TASK_CHECK_STATUS_UPDATED),
      (29, "REASON_TASK_HEALTH_CHECK_STATUS_UPDATED", REASON_TASK_HEALTH_CHECK_STATUS_UPDATED),
      (25, "REASON_TASK_GROUP_INVALID", REASON_TASK_GROUP_INVALID),
      (26, "REASON_TASK_GROUP_UNAUTHORIZED", REASON_TASK_GROUP_UNAUTHORIZED), (14, "REASON_TASK_INVALID", REASON_TASK_INVALID),
      (15, "REASON_TASK_UNAUTHORIZED", REASON_TASK_UNAUTHORIZED), (16, "REASON_TASK_UNKNOWN", REASON_TASK_UNKNOWN)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.TaskStatus.Reason") ["Mesos"] ["Protos", "TaskStatus"] "Reason")
      ["Mesos", "Protos", "TaskStatus", "Reason.hs"]
      [(0, "REASON_COMMAND_EXECUTOR_FAILED"), (21, "REASON_CONTAINER_LAUNCH_FAILED"), (19, "REASON_CONTAINER_LIMITATION"),
       (20, "REASON_CONTAINER_LIMITATION_DISK"), (8, "REASON_CONTAINER_LIMITATION_MEMORY"), (17, "REASON_CONTAINER_PREEMPTED"),
       (22, "REASON_CONTAINER_UPDATE_FAILED"), (33, "REASON_MAX_COMPLETION_TIME_REACHED"),
       (23, "REASON_EXECUTOR_REGISTRATION_TIMEOUT"), (24, "REASON_EXECUTOR_REREGISTRATION_TIMEOUT"),
       (1, "REASON_EXECUTOR_TERMINATED"), (2, "REASON_EXECUTOR_UNREGISTERED"), (3, "REASON_FRAMEWORK_REMOVED"),
       (4, "REASON_GC_ERROR"), (5, "REASON_INVALID_FRAMEWORKID"), (6, "REASON_INVALID_OFFERS"),
       (27, "REASON_IO_SWITCHBOARD_EXITED"), (7, "REASON_MASTER_DISCONNECTED"), (9, "REASON_RECONCILIATION"),
       (18, "REASON_RESOURCES_UNKNOWN"), (10, "REASON_SLAVE_DISCONNECTED"), (11, "REASON_SLAVE_REMOVED"),
       (31, "REASON_SLAVE_REMOVED_BY_OPERATOR"), (32, "REASON_SLAVE_REREGISTERED"), (12, "REASON_SLAVE_RESTARTED"),
       (13, "REASON_SLAVE_UNKNOWN"), (30, "REASON_TASK_KILLED_DURING_LAUNCH"), (28, "REASON_TASK_CHECK_STATUS_UPDATED"),
       (29, "REASON_TASK_HEALTH_CHECK_STATUS_UPDATED"), (25, "REASON_TASK_GROUP_INVALID"), (26, "REASON_TASK_GROUP_UNAUTHORIZED"),
       (14, "REASON_TASK_INVALID"), (15, "REASON_TASK_UNAUTHORIZED"), (16, "REASON_TASK_UNKNOWN")]

instance P'.TextType Reason where
  tellT = P'.tellShow
  getT = P'.getRead