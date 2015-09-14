function scale(planets, solarSystem, slotName, scalePlanet) {
    planets.xCoords = solarSystem.x - slotName.x
    planets.yCoords = solarSystem.y - slotName.y

    console.log(planets.xCoords, planets.yCoords)

    planets.anchors.fill = undefined
    scalePlanet.running = true
}
