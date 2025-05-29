#!/bin/bash

# 폴더 리스트
folders=("AMPED" "BeCL" "CeSD" "cic" "exp_local" "master_SBRL" "new_master_SBRL" "new_new_SBRLv7" "new_SBRLv3" "new_SBRLv7" "original_CeSD" "prev" "SBRL" "SBRLv1_1" "SBRLv2" "SBRLv3" "SBRLv6" "SBRLv7" "SBRLv8" "SBRLv8_1" "SBRLv9" "SBRLv10" "SBRLv12" "SBRLv12_1" "SBRLv12_2" "SBRLv12_4" "SBRLv13" "SBRLv14" "url_benchmark")

for folder in "${folders[@]}"; do
    echo "📦 Copying $folder..."

    if scp -P $PORT -r "$SERVER:$REMOTE_PATH/$folder" "$LOCAL_PATH/"; then
        # 성공 시: 성공 로그에 없으면 추가하고, 실패 로그에서는 삭제
        grep -qx "✅ $folder copied successfully." new_scp_success.log || echo "✅ $folder copied successfully." >> new_scp_success.log
        sed -i "/❌ $folder failed to copy./d" new_scp_fail.log
    else
        # 실패 시: 실패 로그에 없으면 추가
        grep -qx "❌ $folder failed to copy." new_scp_fail.log || echo "❌ $folder failed to copy." >> new_scp_fail.log
    fi
done
