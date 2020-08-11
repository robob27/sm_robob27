-- Can haz cheezburger functions

function hasWave()
    local wave = Tracker:ProviderCountForCode("wave")
    if wave >= 1 then
        return 1
    end
    return 0
end

function hasPlasma()
    local plasma = Tracker:ProviderCountForCode("plasma")
    if plasma >= 1 then
        return 1
    end
    return 0
end

function hasCharge()
    local charge = Tracker:ProviderCountForCode("charge")
    if charge >= 1 then
        return 1
    end
    return 0
end

function hasSpazer()
    local charge = Tracker:ProviderCountForCode("spazer")
    if charge >= 1 then
        return 1
    end
    return 0
end

function hasIce()
    local ice = Tracker:ProviderCountForCode("ice")
    if ice >= 1 then
        return 1
    end
    return 0
end

function hasHiJump()
    local hijump = Tracker:ProviderCountForCode("hijump")
    if hijump >= 1 then
        return 1
    end
    return 0
end


function hasSpaceJump()
    local space = Tracker:ProviderCountForCode("space")
    if space >= 1 then
        return 1
    end
    return 0
end

function hasVaria()
    local varia = Tracker:ProviderCountForCode("varia")
    if varia >= 1 then
        return 1
    end
    return 0
end

function hasGravity()
    local gravity = Tracker:ProviderCountForCode("gravity")
    if gravity >= 1 then
        return 1
    end
    return 0
end

function hasGrapple()
    local grapple = Tracker:ProviderCountForCode("grapple")
    if grapple >= 1 then
        return 1
    end
    return 0
end

function hasBasicBombs()
    local bomb = Tracker:ProviderCountForCode("bomb")
    if bomb >= 1 then
        return 1
    end
    return 0
end

function countPB()
    return Tracker:ProviderCountForCode("powerbomb")
end

function hasPowerBombs()
    if countPB() >= 1 then
        return 1
    end
    return 0
end

function hasBombs()
    if hasBasicBombs() == 1 or hasPowerBombs() == 1 then
        return 1
    end
    return 0
end

function hasMorph()
    local morph = Tracker:ProviderCountForCode("morph")
    if morph >= 1 then
        return 1
    end
    return 0
end

function hasMissiles()
    local missile = Tracker:ProviderCountForCode("missile")
    if missile >= 1 then
        return 1
    end
    return 0
end

function hasSuper()
    local super = Tracker:ProviderCountForCode("super")
    if super >= 1 then
        return 1
    end
    return 0
end

function countTanks()
    local etanks = Tracker:ProviderCountForCode("etank")
    local reservetanks = Tracker:ProviderCountForCode("reservetank")
    return etanks + reservetanks
end

function hasScrewAttack()
    local screw = Tracker:ProviderCountForCode("screw")
    if screw >= 1 then
        return 1
    end
    return 0
end

function hasSpringBall()
    local spring = Tracker:ProviderCountForCode("spring")
    if spring >= 1 then
        return 1
    end
    return 0
end

function hasGravity()
    local gravity = Tracker:ProviderCountForCode("gravity")
    if gravity >= 1 then
        return 1
    end
    return 0
end

function hasSpeedBooster()
    local speed = Tracker:ProviderCountForCode("speed")
    if speed >= 1 then
        return 1
    end
    return 0
end


-- Can do the things functions

function heatProof()
    if hasVaria() == 1 then
        return 1
    end
    return 0
end

function canBomb()
    if hasMorph() == 1 and hasBasicBombs() == 1 then
        return 1
    end
    return 0
end

function canPowerBomb()
    if hasMorph() == 1 and hasPowerBombs() == 1 then
        return 1
    end
    return 0
end

function canFly()
    if hasSpaceJump() == 1 or canBomb() == 1 then
        return 1
    end
    return 0
end

function canOpenRedDoors()
    if hasMissiles() == 1 or hasSuper() == 1 then
        return 1
    end
    return 0
end

function canOpenGreenDoors()
    if hasSuper() == 1 then
        return 1
    end
    return 0
end

function canOpenYellowDoors()
    if canPowerBomb() == 1 then
        return 1
    end
    return 0
end

function canBombWalls()
    if canBomb() == 1 or canPowerBomb() == 1 or hasScrewAttack() == 1 then
        return 1
    end
    return 0
end

function canBombPassages()
    if canBomb() == 1 or canPowerBomb() == 1 then
        return 1
    end
    return 0
end

function canDoSuitlessMaridia()
    if hasHiJump() == 1 and hasGrapple() == 1 and (hasIce() == 1 or hasSpringBall() == 1) then
        return 1
    end
    return 0
end


-- Access logic functions

function canAccessGauntlet()
    if (
      canBomb() == 1 or
        (canPowerBomb() == 1 and countPB() >= 10) or
        hasScrewAttack() == 1 or
        (hasSpeedBooster() == 1 and canPowerBomb() == 1 and countTanks() >= 2)
    ) then
        return 1
    end
    return 0
end

function canAccessRedBrinstar()
    if hasSuper() == 1 and ((hasMorph() == 1 and canBombWalls() == 1) or canPowerBomb() == 1) then
        return 1
    end
    return 0
end

function canAccessPinkBrinstar()
    if canPowerBomb() == 1 or (canOpenRedDoors() == 1 and (canBombWalls() == 1 or hasSpeedBooster() == 1)) then
        return 1
    end
    return 0
end

function canAccessKraid()
    if canAccessRedBrinstar() == 1 and canBombPassages() == 1 then
        return 1
    end
    return 0
end

-- functions added or modified by Robob27
function needMinorItems()
  local minorItems = Tracker:ProviderCountForCode("minor")

  if minorItems >= 1 then
      return 0
  end

  return 1
end

function doneMinorItems()
  if needMinorItems() == 1 then
    return 0
  end

  return 1
end

function isNotCasual()
  local casual = Tracker:ProviderCountForCode("noob")

  if casual >= 1 then
      return 0
  end

  return 1
end

function isCasual()
  if isNotCasual() == 1 then
    return 0
  end

  return 1
end

function canSpringBallJump()
  if hasMorph() == 1 and hasSpringBall() == 1 then
    return 1
  end

  return 0
end

function hasEnergyOrDefenseForXRayAccess()
  if (hasVaria() == 1 and countTanks() >= 3) or countTanks() >= 5 then
    return 1
  end

  return 0
end


function canAccessXRayTournament()
  if hasEnergyOrDefenseForXRayAccess() == 1 and (canBomb() == 1 or (hasHiJump() == 1 and hasSpeedBooster() == 1) or canSpringBallJump() == 1) then
    return 1
  end

  return 0
end

function canEnterAndLeaveGauntletTournament()
  if hasMorph() == 1 and (hasBasicBombs() == 1 or countPB() >= 10) or
    hasScrewAttack() == 1 or
    hasSpeedBooster() == 1 and canPowerBomb() == 1 and countTanks() >= 2 then
      return 1
  end

  return 0
end

function canEnterAndLeaveGauntlet()
  if hasMorph() == 1 and (canFly() == 1 or hasSpeedBooster() == 1) and (
    canBomb() == 1 or
    canPowerBomb() == 1 and countPB() >= 10 or
    hasScrewAttack() == 1
  ) then
    return 1
  end

  return 0
end

function canHellRun()
  if heatProof() == 1 or countTanks() >= 5 then
      return 1
  end

  return 0
end

function canHellRunShort()
  if heatProof() == 1 or countTanks() >= 2 then
      return 1
  end

  return 0
end

function canAccessWreckedShip()
  if canCrossMoat() == 1 and hasSuper() == 1 and canPowerBomb() == 1 then
    return 1
  end

  return 0
end

function canAccessWreckedShipTournament()
  if hasSuper() == 1 and canPowerBomb() == 1 then
    return 1
  end

  return 0
end

-- only applies to casual
function canCrossMoat()
  if (
    hasSpeedBooster() == 1 or
    hasGrapple() == 1 or
    hasSpaceJump() == 1 or
    (hasGravity() == 1 and (canFly() == 1 or hasHiJump() == 1))
  ) then
    return 1
  end

  return 0
end

function canAccessWreckedShipReserve()
  if canAccessWreckedShip() == 1 and hasSpeedBooster() == 1 and (
    hasGrapple() == 1 or
    hasSpaceJump() == 1 or
    (hasVaria() == 1 and countTanks() >= 2) or
    countTanks() >= 3
  ) then
    return 1
  end

  return 0
end

function canAccessWreckedShipReserveTournament()
  if canAccessWreckedShipTournament() == 1 and hasSpeedBooster() == 1 and
    (hasVaria() == 1 or countTanks() >= 2) then
      return 1
  end

  return 0
end

function canAccessPlasmaTournament()
  if canAccessDraygonTournament() == 1 and
    ((hasCharge() == 1 and countTanks() >= 3) or hasScrewAttack() == 1 or hasPlasma() == 1 or hasSpeedBooster() == 1) and
    (canFly() == 1 or hasHiJump() == 1 or canSpringBallJump() == 1 or hasSpeedBooster() == 1)
  then
    return 1
  end

  return 0
end

function canAccessPlasma()
  if canAccessDraygon() == 1 and
    (hasScrewAttack() == 1 or hasPlasma() == 1) and
    (canFly() == 1 or hasHiJump() == 1)
  then
    return 1
  end

  return 0
end

function canAccessIce()
  if canAccessWestNorfair() == 1 and hasSuper() == 1 and canPowerBomb() == 1 and hasVaria() == 1 and hasSpeedBooster() == 1 then
    return 1
  end

  return 0
end

function canAccessIceTournament()
  if canAccessWestNorfair() == 1 and hasSuper() == 1 and (hasVaria() == 1 or countTanks() >= 3) then
    return 1
  end

  return 0
end

function canAccessWestNorfair()
  if canBombWalls() == 1 or hasSpeedBooster() == 1 and (hasSuper() == 1 and hasMorph() == 1) then
    return 1
  end

  return 0
end

function canAccessCrocomireOld()
  if canAccessHeatedNorfair() == 1 and
    (canAccessKraid() == 1 and canPowerBomb() == 1 and hasSpeedBooster() == 1)
  then
    return 1
  end

  return 0
end

function canAccessCrocomireTournamentOld()
  if (canAccessKraid() == 1 and canPowerBomb() == 1 and hasSpeedBooster() == 1 and countTanks() >= 2) then
    return 1
  end

  return 0
end

function canAccessCrocomire()
  if (canBombWalls() == 1 or hasSpeedBooster() == 1) and (hasSuper() == 1 and hasMorph() == 1) and
    hasVaria() == 1 and hasSuper() == 1 and (
      (canPowerBomb() == 1 and hasSpeedBooster() == 1) or
      (hasSpeedBooster() == 1 and hasWave() == 1) or
      (
        hasMorph() == 1 and (canFly() == 1 or hasHiJump() == 1) and (hasGravity() == 1 and hasWave() == 1)
      )
    ) then
      return 1
  end

  return 0
end

function canAccessCrocomireTournament()
  if (canBombWalls() == 1 or hasSpeedBooster() == 1) and (hasSuper() == 1 and hasMorph() == 1) and hasSuper() == 1 and
    ((hasSpeedBooster() == 1 and countTanks() >= 2) or canHellRun() == 1) and
    (
      (canFly() == 1 or hasHiJump() == 1) or
      canSpringBallJump() == 1 or
      (
        hasVaria() == 1 and (hasIce() == 1 or hasSpeedBooster() == 1)
      )
    ) and
    (canBombPassages() == 1 or hasSpeedBooster() == 1 or (hasVaria() == 1 and hasMorph() == 1))
  then
      return 1
  end

  return 0
end

function canAccessHeatedNorfairTournament()
  if canAccessRedBrinstar() == 1 and canHellRun() == 1 then
    return 1
  end

  return 0
end

function canAccessHeatedNorfair()
  if canAccessRedBrinstar() == 1 and heatProof() == 1 then
    return 1
  end

  return 0
end

function canAccessNorfairReserve()
  if canAccessHeatedNorfair() == 1 and
    (canFly() == 1 or hasGrapple() == 1 or hasIce() == 1 or hasSpringBall() == 1 or hasHiJump() == 1)
  then
    return 1
  end

  return 0
end

function canAccessNorfairReserveTournament()
  if canAccessHeatedNorfairTournament() == 1 and
    (canFly() == 1 or hasGrapple() == 1 or hasIce() == 1 or hasSpringBall() == 1 or hasHiJump() == 1)
  then
    return 1
  end

  return 0
end

function canAccessLowerNorfair()
  if canAccessHeatedNorfair() == 1 and canPowerBomb() == 1 and hasVaria() == 1 and
    (hasSpaceJump() == 1 and hasGravity() == 1)
  then
    return 1
  end
  return 0
end

function canAccessLowerNorfairTournament()
  if canAccessHeatedNorfairTournament() == 1 and canPowerBomb() == 1 and hasVaria() == 1 and
    (hasHiJump() == 1 or hasGravity() == 1)
  then
    return 1
  end

  return 0
end

function canAccessGravity()
  if canAccessWreckedShip() == 1 and (hasVaria() == 1 or countTanks() >= 1) then
    return 1
  end

  return 0
end

function canAccessGravityTournament()
  if canAccessWreckedShipTournament() == 1 and (hasVaria() == 1 or countTanks() >= 1) then
    return 1
  end

  return 0
end

function canDoWorstRoom()
  if canAccessLowerNorfair() == 1 and canPowerBomb() == 1 and hasSpaceJump() == 1 and hasGravity() == 1 then
    return 1
  end

  return 0
end

function canDoWorstRoomTournament()
  if canAccessLowerNorfairTournament() == 1 and hasVaria() == 1 and canPowerBomb() == 1 and
    (hasHiJump() == 1 or hasGravity() == 1) and
    (canFly() == 1 or hasHiJump() == 1 or canSpringBallJump() == 1 or hasIce() == 1 and hasCharge() == 1) and
    (canBombPassages() == 1 or hasScrewAttack() == 1 and hasSpaceJump() == 1) and
    (hasMorph() == 1 or countTanks() >= 5) then
      return 1
  end

  return 0
end

function canAccessSpringBall()
  if canAccessInnerMaridia() == 1 and hasSuper() == 1 and hasGrapple() == 1 and canPowerBomb() == 1 and (hasSpaceJump() == 1 or hasHiJump() == 1) then
    return 1
  end

  return 0
end

function canAccessSpringBallTournament()
  if canAccessInnerMaridiaTournament() == 1 and hasSuper() == 1 and canPowerBomb() == 1 and (
    hasGravity() == 1 and (canFly() == 1 or hasHiJump() == 1) or
    hasIce() == 1 and hasHiJump() == 1 and canSpringBallJump() == 1 and hasSpaceJump() == 1
  ) then
    return 1
  end

  return 0
end


function canAccessOuterMaridia()
  if hasGravity() == 1 and canAccessRedBrinstar() == 1 and canPowerBomb() == 1 then
    return 1
  end

  return 0
end

function canAccessOuterMaridiaTournament()
  if canAccessRedBrinstar() == 1 and canPowerBomb() == 1 and
    (hasGravity() == 1 or (hasHiJump() == 1 and (hasIce() == 1 or hasSpringBall() == 1)))
  then
    return 1
  end

  return 0
end


function canAccessInnerMaridia()
  if hasGravity() == 1 and canAccessRedBrinstar() == 1 and canPowerBomb() == 1 and (canFly() == 1 or hasSpeedBooster() == 1 or hasGrapple() == 1) then
    return 1
  end

  return 0
end

function canAccessInnerMaridiaTournament()
  if canAccessRedBrinstar() == 1 and canPowerBomb() == 1 and
    (
      hasGravity() == 1 or
      (
        hasHiJump() == 1 and
        (
          hasIce() == 1 or (canSpringBallJump() == 1 and hasGrapple() == 1)
        )
      )
    )
    then
      return 1
  end

  return 0
end

function canAccessBotwoon()
  if canAccessInnerMaridia() == 1 and hasSpeedBooster() == 1 then
    return 1
  end

  return 0
end

function canAccessBotwoonTournament()
  if canAccessInnerMaridiaTournament() == 1 and (hasIce() == 1 or (hasSpeedBooster() == 1 and hasGravity() == 1)) then
    return 1
  end

  return 0
end

function canAccessDraygon()
  if (canAccessBotwoon() == 1 and hasGravity() == 1) and (hasSpeedBooster() == 1 and (hasHiJump() == 1 or canFly() == 1)) then
    return 1
  end

  return 0
end

function canAccessDraygonTournament()
  if canAccessBotwoonTournament() == 1 and hasGravity() == 1 then
    return 1
  end

  return 0
end

function canAccessBrinstarGateEnergyTank()
  if canPowerBomb() == 1 and hasWave() == 1 then
    return 1
  end

  return 0
end

function canAccessBrinstarGateEnergyTankTournament()
  if canPowerBomb() == 1 and hasSuper() == 1 then
    return 1
  end

  return 0
end
