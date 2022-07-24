RegisterNetEvent("fv_paper:open")
AddEventHandler("fv_paper:open", function(title, text)
    SetNuiFocus(true, true)
    SendNUIMessage({action = 'enable',
                    title = title,
                    text = text
                })
    startAnim()
    TriggerScreenblurFadeIn(0)
end)

RegisterNUICallback('closePaper', function()
    SetNuiFocus(false, false)
    stopAnim()
    TriggerScreenblurFadeOut(0)
end)

function startAnim()
    playerPed = PlayerPedId()
    bookProp = CreateObject('prop_cd_paper_pile1', 0.15, 0.03, -0.065, 0.0, 180.0, 90.0)
    local bone = GetPedBoneIndex(playerPed, 6286)
    loadAnimDict("cellphone@")
    TaskPlayAnim(playerPed, "cellphone@", "cellphone_text_read_base", 1.5, 1.5, -1, 1, 0, 0, 0, 0)
    AttachEntityToEntity(bookProp, playerPed, bone, 0.1, 0.0, -0.06, 90.0, 320.0, 150.0, 1, 1, 0, 0, 2, 1)
end

function stopAnim()
    ClearPedTasks(playerPed)
    DeleteEntity(bookProp)
end

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do        
        Citizen.Wait(1)
    end
end