--<< ====================================================================== >>--
-- Setup Timers                                                               --
--<< ====================================================================== >>--
local BS = AceLibrary("Babble-Spell-2.2")
local L = AceLibrary("AceLocale-2.2"):new("Chronometer")

function Chronometer:DruidSetup()
	local _, eclass = UnitClass("player")
	if eclass ~= "DRUID" then return end

	self:AddGroup(1, true,  "MAGENTA")
	self:AddGroup(2, false, "MAROON")
	self:AddGroup(3, true,  "MAGENTA")
--                kind,       name,                  duration, targeted, isgain, selforselect, extra
	self:AddTimer(self.SPELL, BS["Abolish Poison"],         8, 1,1,1) -- 驱毒术
	self:AddTimer(self.SPELL, BS["Bash"],                   2, 1,0,0, { d={rs=1, tn=BS["Brutal Impact"], tb=0.5} }) -- 重击
	self:AddTimer(self.SPELL, BS["Barkskin"],              15, 0,1,1) -- 树皮术
	self:AddTimer(self.SPELL, BS["Dash"],                  15, 0,1,1) -- 急奔
	self:AddTimer(self.SPELL, BS["Demoralizing Roar"],     30, 0,0,0, { rc=true }) -- 挫志咆哮
	self:AddTimer(self.SPELL, BS["Enrage"],                10, 0,1,1) -- 狂怒
	self:AddTimer(self.SPELL, BS["Entangling Roots"],      12, 1,0,0, { gr=1, rc=true, d={rs=3} }) -- 纠缠根须
	self:AddTimer(self.SPELL, BS["Faerie Fire"],           40, 1,0,0, { gr=2, rc=true }) -- 精灵之火
	self:AddTimer(self.SPELL, BS["Faerie Fire (Feral)"],     40, 1,0,0, { gr=2, rc=true }) -- 精灵之火（野性）
	self:AddTimer(self.SPELL, BS["Feral Charge"],           4, 1,0,0) -- 野性冲锋
	self:AddTimer(self.SPELL, BS["Frenzied Regeneration"], 10, 0,1,1) -- 狂暴回复
	self:AddTimer(self.SPELL, BS["Hibernate"],             20, 1,0,0, { gr=3, rc=true, d={rs=10}  }) -- 休眠
	self:AddTimer(self.SPELL, BS["Innervate"],             20, 1,1,1) -- 激活
	self:AddTimer(self.SPELL, BS["Insect Swarm"],          12, 1,0,0, { rc=true }) -- 虫群
	self:AddTimer(self.SPELL, BS["Nature's Grasp"],        45, 0,1,1, { cr="BLUE", ea={[BS["Entangling Roots"]]=45} })
	self:AddTimer(self.SPELL, BS["Moonfire"],              12, 1,0,0, { rc=true }) -- 自然之握
	self:AddTimer(self.SPELL, BS["Pounce"],                 2, 1,0,0, { ea={[BS["Pounce Bleed"]]=1} }) -- 月火术
	self:AddTimer(self.SPELL, BS["Rake"],                   9, 1,0,0, { rc=true }) -- 突袭
	self:AddTimer(self.SPELL, BS["Regrowth"],              21, 1,1,1, { rc=true, mc=BS["Swiftmend"] }) -- 愈合
	self:AddTimer(self.SPELL, BS["Rejuvenation"],          12, 1,1,1, { rc=true, mc=BS["Swiftmend"] }) -- 回春术
	self:AddTimer(self.SPELL, BS["Rip"],                   12, 1,0,0, { rc=true }) -- 撕扯
	self:AddTimer(self.SPELL, BS["Soothe Animal"],         15, 1,0,0, { rc=true }) -- 安抚动物
	self:AddTimer(self.SPELL, BS["Starfire"],               0, 1,0,0, { ea={[BS["Starfire Stun"]]=1} }) -- 星火术
	self:AddTimer(self.SPELL, BS["Tiger's Fury"],           6, 0,1,1, { rc=true, d={tn=BS["Blood Frenzy"], tb=3}  }) -- 猛虎之怒 turtle WOW

	self:AddTimer(self.EVENT, BS["Entangling Roots"],      12, 1,0,1, { gr=1, d={rs=3}, a=1 }) -- 强化纠缠根须
	self:AddTimer(self.EVENT, BS["Nature's Grace"],        15, 0,1,1, { cr="GREEN", a=1 }) -- 自然之赐

	self:AddTimer(self.EVENT, BS["Clearcasting"],          15, 0,1,1, { cr="GREEN", a=1 }) -- 节能施法
	self:AddTimer(self.EVENT, BS["Pounce Bleed"],          18, 1,0,0, { xn=BS["Pounce"] }) -- 突袭
	self:AddTimer(self.EVENT, BS["Starfire Stun"],          3, 1,0,0, { xn=BS["Starfire"] })
	self:AddTimer(self.EVENT, BS["Blood Frenzy"],          0, 0,1,1, { d={tn=BS["Blood Frenzy"], tb=6}, a=1 }) -- 血之狂暴 turtle WOW
end

table.insert(Chronometer.dataSetup, Chronometer.DruidSetup)
