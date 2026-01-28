function love.load()
    love.graphics.setBackgroundColor(0, 255, 0)
    Abonnieren = love.graphics.newImage("assets/Abonnieren.png")
    Abonniert = love.graphics.newImage("assets/Abonniert.png")
    geliked = love.graphics.newImage("assets/geliked.png")
    Maus = love.graphics.newImage("assets/Maus.png")
    Klick = love.audio.newSource("assets/Klick.mp3", "static")
end
function playKlick()
    local sfx = Klick:clone()
    sfx:play()
end
local Maust = {
    x = 1460,
    y = 795,
    vx = 100,
   vy = 10,
   Frames1 = 157,
   Framesy2 = 70,
   Framesx2 = 500,
}
local Frame1 = false
local timer = 0
local startAnimation = false
local Frame2 = false
function love.update(dt)
    if not startAnimation then
        timer = timer + dt
        if timer >= 3 then
            startAnimation = true
        end
    end
    if startAnimation == true and Maust.Frames1 > 0 then
    Maust.y = Maust.y - 2
    Maust.Frames1 = Maust.Frames1 - 2
    elseif Maust.Frames1 <= 0 and not Frame1 then
        Abonnieren = Abonniert
        Frame1 = true
        playKlick()
end
if Frame1 == true and Maust.Framesy2 > 0 then
    Maust.y = Maust.y + 2
    Maust.Framesy2 = Maust.Framesy2 - 2
elseif Frame1 == true and Maust.Framesx2 > 0 then
    Maust.x = Maust.x - 2
    Maust.Framesx2 = Maust.Framesx2 - 2
end
if Maust.Framesx2 <= 0 and Maust.Framesy2 <= 0 and not Frame2 then
    Frame2 = true
    Abonnieren = geliked
    playKlick()
end
if Frame2 == true then
Maust.y = Maust.y + 3
end
end
function love.draw()
    love.graphics.draw(Abonnieren, 680, 570, 0, 2)
    love.graphics.draw(Maus, Maust.x, Maust.y, 0, 3)
end
