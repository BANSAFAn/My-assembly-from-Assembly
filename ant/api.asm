FLT_PREOP_CALLBACK_STATUS    PreOperationCallback    (__inout    PFLT_CALLBACK_DATA    Data, 
     __in    PCFLT_RELATED_OBJECTS    FltObjects, 
     __deref_out_opt    PVOID    *CompletionContext) 
{ 
     ... 
 
     if    (    all_good    ) 
     { 
         return    FLT_PREOP_SUCCESS_NO_CALLBACK; 
     } 
     else 
     { 
         //    Access    denied 
         Data->IoStatus.Information    =    0; 
         Data->IoStatus.Status    =    STATUS_ACCESS_DENIED; 
         return    FLT_PREOP_COMPLETE; 
     } 
 } 