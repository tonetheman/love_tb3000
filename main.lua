
local grass = {}
local current_map = nil

function love.update(dt)
end


function draw_map()
    for i=1,10 do
        for j=1,10 do
            if current_map[i][j]==1 then
                love.graphics.draw(grass[1],j*20,i*20)
            elseif current_map[i][j]==2 then
                love.graphics.draw(grass[2],j*20,i*20)
            elseif current_map[i][j]==3 then
                love.graphics.draw(grass[3],j*20,i*20)
            end
        end
    end
end

function love.draw()
    love.graphics.scale(2,2)
    if current_map ~= nil then
        draw_map()
    end
end

function load_map()
    local tmp = {}
    for i=1,10 do
        local row = {}
        for j=1,10 do
            table.insert(row,love.math.random(1,3))
        end
        table.insert(tmp,row)
    end
    return tmp
end

function load_tiles()
    grass[1] = love.graphics.newImage("art/Tiles/tile_0000.png")
    grass[2] = love.graphics.newImage("art/Tiles/tile_0001.png")
    grass[3] = love.graphics.newImage("art/Tiles/tile_0002.png")

    current_map = load_map()
end

function love.load()
    love.math.setRandomSeed(love.timer.getTime())
    load_tiles()
end

