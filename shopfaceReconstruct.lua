local EntriesOBJ = 
{ 
    0x0054, 
    0x005C, 
    0x005D, 
    0x06C1,
    0x028A,
    0x05EF,
    0x061B,
    0x0657,
    0x05CF,
    0x04F5,
    0x0656,
    0x0840,
    0x055A,
    0x0554,
    0x02B5,
    0x029E,
    0x029D,
    0x03BE,
    0x0396,
    0x0397,
    0x0955,
    0x095B,
    0x095C,
    0x0065,
    0x0063,
    0x0064,
    0x0062,
    0x0066,
    0x04D0,
    0x081D,
    0x081E,
    0x005E,
    0x005F,
    0x0060,
    0x0061,
    0x02D4,
    0x0819,
    0x005A,
    0x0A0B,
    0x0A12,
    0x0A13
}

local EntriesFAC = 
{
    "p_ex100",
    "p_ex020",
    "p_ex030",
    "p_ex120",
    "p_lk100",
    "p_lk020",
    "p_lk030",
    "p_ex100_30",
    "p_wi020",
    "p_wi030",
    "p_ex100_20",
    "p_ex100_20",
    "p_ex020_20",
    "p_ex030_20",
    "p_ex100_10",
    "p_ex020_10",
    "p_ex030_10",
    "p_lm100",
    "n_lm010",
    "n_lm020",
    "p_xm100",
    "p_xm020",
    "p_xm030",
    "p_he000",
    "p_mu000",
    "p_mu010",
    "p_al000",
    "p_ca000",
    "p_ca000",
    "p_ca000",
    "p_ca000",
    "p_bb000",
    "p_nm000",
    "p_nm000_10",
    "p_lk000",
    "p_tr000",
    "p_eh000",
    "p_ex110",
    "p_ca100",
    "p_ca020",
    "p_ca030"
}

function GetTableLng(tbl)
    local getN = 0
    for n in pairs(tbl) do 
      getN = getN + 1 
    end
    return getN
  end

function _OnFrame()
    if ReadInt(0x860000) == 0x00 then
        for i = 1, GetTableLng(EntriesOBJ) do
            z = i - 1
            calcFAC = BASE_ADDR + 0x870000 + (0x10 * z)
            WriteString(0x870000 + (0x10 * z), EntriesFAC[i])
            WriteInt(0x860000 + (0x10 * z), EntriesOBJ[i])
            WriteLong(0x860008 + (0x10 * z), calcFAC)
        end

        WriteInt(0x860000 + (0x10 * GetTableLng(EntriesOBJ)), 0xFFFFFFFF)

        if ReadString(0x09A98B0, 0x04) == "KH2J" then
            WriteInt(0x29BB46, 0x5C44B6)
            WriteInt(0x29BB55, 0x5C44AF)
            WriteInt(0x29EFCB, 0x5C1031)
            WriteInt(0x29F026, 0x5C0FDE)
            WriteInt(0x2A0284, 0x5BFD80)
            WriteInt(0x2A0293, 0x5BFD69)
            ConsolePrint("Initialized for STEAM v1.0.0.10!")
        elseif ReadString(0x09A9330, 0x04) == "KH2J" then
            WriteInt(0x29B1F6, 0x5C4E06)
            WriteInt(0x29B205, 0x5C4DFF)
            WriteInt(0x29E67B, 0x5C1981)
            WriteInt(0x29E6D6, 0x5C192E)
            WriteInt(0x29F934, 0x5C06D0)
            WriteInt(0x29F943, 0x5C06B9)
            ConsolePrint("Initialized for EPIC v1.0.0.10!")
        end
    end
end