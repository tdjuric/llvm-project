; ModuleID = 'jumptab.cpp'
source_filename = "jumptab.cpp"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nounwind optsize memory(inaccessiblemem: readwrite) uwtable
define dso_local noundef signext i32 @_Z7jumptabi(i32 noundef signext %a) local_unnamed_addr #0 {
entry:
  %b = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %b)
  store volatile i32 0, ptr %b, align 4, !tbaa !7
  switch i32 %a, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb2
    i32 3, label %sw.bb3
    i32 4, label %sw.bb4
    i32 5, label %sw.bb5
    i32 6, label %sw.bb6
    i32 7, label %sw.bb7
    i32 8, label %sw.bb8
    i32 9, label %sw.bb9
    i32 10, label %sw.bb10
    i32 11, label %sw.bb11
    i32 12, label %sw.bb12
    i32 13, label %sw.bb13
  ]

sw.bb:                                            ; preds = %entry
  store volatile i32 6, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  store volatile i32 5, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  store volatile i32 4, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  store volatile i32 3, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  store volatile i32 2, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  store volatile i32 1, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb6:                                           ; preds = %entry
  store volatile i32 7, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb7:                                           ; preds = %entry
  store volatile i32 8, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  store volatile i32 9, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  store volatile i32 10, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry
  store volatile i32 11, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  store volatile i32 12, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb12:                                          ; preds = %entry
  store volatile i32 7, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.bb13:                                          ; preds = %entry
  store volatile i32 8, ptr %b, align 4, !tbaa !7
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %sw.bb13, %sw.bb12, %sw.bb11, %sw.bb10, %sw.bb9, %sw.bb8, %sw.bb7, %sw.bb6, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %b.0.b.0.b.0.b.0. = load volatile i32, ptr %b, align 4, !tbaa !7
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %b)
  ret i32 %b.0.b.0.b.0.b.0.
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none) uwtable
define dso_local noundef signext i32 @main() local_unnamed_addr #2 {
entry:
  ret i32 0
}

attributes #0 = { mustprogress nofree norecurse nounwind optsize memory(inaccessiblemem: readwrite) uwtable "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+zicsr,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none) uwtable "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+zicsr,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 8, !"SmallDataLimit", i32 8}
!6 = !{!"clang version 18.1.2 (https://github.com/llvm/llvm-project.git f09d2802d130f57d22117931f88939c194d21fcc)"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
