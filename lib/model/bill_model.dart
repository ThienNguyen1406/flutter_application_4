class BillModel {
  String? hoTen;
  String? maBenhNhan;
  String? dienThoaiDD;
  String? maHoaDon;
  String? thoiGianKham;
  String? coSoKham;
  String? bacSyPhuTrach;
  String? tenDichVu;
  int? soLuong;
  double? donGia;
  String? maCoSo;

  BillModel(
      {this.hoTen,
      this.maBenhNhan,
      this.dienThoaiDD,
      this.maHoaDon,
      this.thoiGianKham,
      this.coSoKham,
      this.bacSyPhuTrach,
      this.tenDichVu,
      this.soLuong,
      this.donGia,
      this.maCoSo});

  BillModel.fromJson(Map<String, dynamic> json) {
    hoTen = json['HoTen'];
    maBenhNhan = json['MaBenhNhan'];
    dienThoaiDD = json['DienThoaiDD'];
    maHoaDon = json['MaHoaDon'];
    thoiGianKham = json['ThoiGianKham'];
    coSoKham = json['CoSoKham'];
    bacSyPhuTrach = json['BacSyPhuTrach'];
    tenDichVu = json['TenDichVu'];
    soLuong = json['SoLuong'];
    donGia = json['DonGia'];
    maCoSo = json['MaCoSo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['HoTen'] = hoTen;
    data['MaBenhNhan'] = maBenhNhan;
    data['DienThoaiDD'] = dienThoaiDD;
    data['MaHoaDon'] = maHoaDon;
    data['ThoiGianKham'] = thoiGianKham;
    data['CoSoKham'] = coSoKham;
    data['BacSyPhuTrach'] = bacSyPhuTrach;
    data['TenDichVu'] = tenDichVu;
    data['SoLuong'] = soLuong;
    data['DonGia'] = donGia;
    data['MaCoSo'] = maCoSo;
    return data;
  }
}
