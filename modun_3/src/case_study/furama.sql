create database if not exists furama;
use furama;
create table vi_tri(
ma_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45)
);
create table trinh_do(
ma_trinh_do int primary key auto_increment,
ten_trinh_do varchar(45));
create table bo_phan(
ma_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45)
);
create table nhan_vien(
ma_nhan_vien int primary key auto_increment,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
lương double,
so_dien_thoại varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
ma_trinh_do int,
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
ma_bo_phan int,
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);
create table loai_khach(
ma_loai_khach int primary key auto_increment,
ten_loai_khach varchar(45)
);
create table khach_hang(
ma_khach_hang int primary key auto_increment,
ma_loai_khach int,
foreign key (ma_loai_khach) references loai_khach(ma_loai_khach),
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit,
so_cmnd varchar(45),
so_dien_thoại varchar(45),
email varchar(45),
dia_chi varchar(45)
 );
 create table loai_dich_vu(
 ma_loai_dich_vu int primary key auto_increment,
 ten_loai_dich_vu varchar(45)
 );
create table kieu_thue(
 ma_kieu_thue int primary key auto_increment,
 ten_kieu_thue varchar(45)
 );
create table dich_vu(
 ma_dich_vu int primary key auto_increment,
 ten_dich_vu varchar(45),
 dien_tich int,
 chi_phi_thue double,
 so_nguoi_toi_da int,
 ma_kieu_thue int,
 foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
 ma_loai_dich_vu int,
 foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
 tieu_chuan_phong varchar(45),
 mo_ta_tien_nghi_khac varchar(45),
 dien_tich_ho_boi double,
 so_tang int,
 dich_vu_mien_phi_di_kem text);
create table hop_dong(
 ma_hop_dong int primary key auto_increment,
 ngay_lam_hop_dong datetime,
 ngay_ket_thuc datetime,
 tien_dat_coc double,
 ma_nhan_vien int,
 foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
 ma_khach_hang int,
 foreign key ( ma_khach_hang) references khach_hang( ma_khach_hang),
 ma_dich_vu int,
  foreign key (ma_dich_vu) references dich_vu(ma_dich_vu));
create table dich_vu_di_kem(
 ma_dich_vu_di_kem int primary key auto_increment,
 ten_dich_vu_di_kem varchar(45),
gia double,
trang_thai varchar(45)
);
create table hop_dong_chi_tiet(
 ma_hop_dong_chi_tiet int primary key auto_increment,
 ma_hop_dong int,
 foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
 ma_dich_vu_di_kem int,
 foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
 so_luong int);
