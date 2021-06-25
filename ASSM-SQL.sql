-- Tạo database
create database QLNHATRO
go
use QLNHATRO

-- Tạo table
create table loainha
(
	MaLN int not null,
	TenLN nvarchar(40) not null,
	constraint pk_ln primary key(MaLN)
)

create table nguoidung
(
	MaND int not null,
	TenND nvarchar(40) not null,
	GioiTinh nvarchar(3) not null,
	DienThoai varchar(15) not null,
	SoNha nvarchar(100) null,
	Duong nvarchar(100) null,
	Phuong nvarchar(100) null,
	Quan nvarchar(100) null,
	Email nvarchar(100) null,
	constraint pk_ng primary key (MaND)
)

create table nhatro
(
	MaNT int not null,
	MaLN int not null,
	NguoiLienHe int not null,
	DienTich float null,
	GiaPhong float null,
	SoNha nvarchar(100) null,
	Duong nvarchar(100) null,
	Phuong nvarchar(100) null,
	Quan nvarchar(100) null,
	MoTa nvarchar(100) null,
	NgayDang date null,
	constraint pk_nt primary key (MaNT)
)

create table danhgia
(
	ID int not null,
	MaND int not null,
	MaNT int not null,
	LikeDisLike int not null,
	NoiDung nvarchar(300) null,
	constraint pk_dg primary key(ID)
)

-- Thêm khóa ngoại
alter table nhatro
add constraint fk_nt_nd foreign key(NguoiLienHe) references nguoidung(MaND),
	constraint fk_nt_ln foreign key(MaLN) references loainha(MaLN)

alter table danhgia
add constraint fk_dg_nd foreign key(MaND) references nguoidung(MaND),
	constraint fk_dg_nt foreign key(MaNT) references nhatro(MaNT)


-- Thêm dữ liệu vào bảng
insert into loainha
values
	('1', N'Trọ nhỏ'),
	('2', N'Trọ trung bình'),
	('3', N'Trọ lớn')

insert into nguoidung
values
	('1', N'Nghĩa Đặng', N'Nam', '027384773', '847', N'Tân Sơn Nhì', N'P10', 'Q1', 'nghiadang@gmail.com'),
	('2', N'Minh Luân', N'Nam', '017385638', '241', N'Tân Hương', N'P3', 'Q10', 'minhluan@gmail.com'),
	('3', N'Hòa Hảo', N'Nữ', '038583374', '143', N'Âu Cơ', N'P.Sơn Kỳ', N'Q.Tân Quý', 'hoahao@gmail.com'),
	('4', N'Ngọc Đào', N'Nữ', '0983749928', '863', N'Tân Trung', 'P7', N'Q2', 'ngocdao@gmail.com'),
	('5', N'Ngọc Thư', N'Nữ', '0638549923', '732', N'Trường Trinh', N'P5', 'Q4', 'ngocthu@gmail.com'),
	('6', N'Tấn Phúc', N'Nam', '0123473623', '873', N'Trưng Trắc', N'P.Linh Trung', 'Q8', 'tanphuc@gmail.com'),
	('7', N'Trí Đặng', N'Nam', '0273958872', '087', N'Lê Duẩn', 'P7', 'Q1', 'tridang@gmail.com'),
	('8', N'Trấn Trung', N'Nam', '0732038342', '003', N'Trưng Nhị', 'P1', N'Q.Gò Vấp', 'trantrung@gmail.com'),
	('9', N'Minh Bảo', N'Nam', '017312733', '327', N'Tân Kỳ', 'P10', 'Q3', 'minhbao@gmail.com'),
	('10', N'Bảo Lâm', N'Nam', '025364792', '547', N'3 tháng 2', 'P4', 'Q2', 'baolamg@gmail.com')

insert into nhatro
values
	('1', '2', '9', '12', '2000000', '512', N'Tân Trung', 'P12', 'Q5', N'Đẹp đễ, Đỉnh', '2020/10/2'),
	('2', '3', '3', '15.2', '2200000', '232', N'Gò Dầu', 'P10', 'Q8', N'Hơi dơ, Ổn', '2021/2/1'),
	('3', '3', '5', '20.5', '2500000', '413', N'Trương Vĩnh Ký', 'P1', 'Q1', N'An ninh, tốt', '2020/8/20'),
	('4', '1', '4', '10', '3000000', '923', N'Bàu Cát', 'P8', 'Q9', N'Giá rẻ, bình dân', '2028/1/3'),
	('5', '2', '2', '13.5', '2800000', '622', N'Nguyễn Quý Anh', 'P6', 'Q3', N'Phù hợp sinh viên, an ninh', '2021/4/30'),
	('6', '1', '10', '8', '1500000', '287', N'Bà Vân', 'P2', 'Q2', N'Mức giá dễ chịu, địa điểm gần Q1', '2020/5/2'),
	('7', '3', '6', '12.2', '2000000', '423', N'Tân Trung', 'P12', 'Q5', N'Đẹp, Đỉnh, Rẻ', '2021/2/21'),
	('8', '3', '1', '18', '3100000', '921', N'Đỗ Nhuận', N'P.An Phú', 'Q12', N'Giá rẻ cho học sinh', '2021/3/17'),
	('9', '2', '8', '12', '2000000', '741', N'Phan Chu Trinh', N'P.Trưng Tây', 'Q1', N'Giá rẻ cho giáo viên', '2018/8/2'),
	('10', '1', '7', '9.6', '2300000', '836', N'Lê Trọng Tấn', N'P.Thảo Điền', 'Q2', N'Đẹp, Gần trung tâm', '2021/4/1')

insert into danhgia
values
	('1', '4', '4', '1', N'Nhà trọ sạch sẽ, đáng tiền'),
	('2', '1', '8', '0', N'Nhà trọ dơ dái, phí tiền'),
	('3', '10', '1', '1', N'Bảo vệ, chị chủ nhà thân thiện'),
	('4', '5', '3', '0', N'An ninh, vệ sinh chưa tốt'),
	('5', '9', '1', '1', N'Nhà trọ sạch sẽ, đáng tiền'),
	('6', '7', '10', '0', N'An ninh, vệ sinh chưa tốt'),
	('7', '3', '2', '1', N'Nhà trọ sạch sẽ, đáng tiền'),
	('8', '8', '9', '0', N'Cơ sở vật chất chưa tốt'),
	('9', '6', '1', '1', N'Nhà trọ sạch sẽ, đáng tiền'),
	('10', '2', '5', '0', N'Chó dữ,dơ dấy chưa đáng tiền'),
	('11', '2', '2', '1', N'Nhà trọ sạch sẽ, đáng tiền'),
	('12', '7', '2', '1', N'Nhà trọ sạch sẽ, đáng tiền')

-- Y3: 1. Thêm thông tin vào các bảng
-- SP chèn dữ liệu vào bảng NGUOIDUNG
if OBJECT_ID('insertNguoidung') is not null
	drop procedure insertNguoidung
go
create procedure insertNguoidung
	@MaND int,
	@TenND nvarchar(40),
	@GioiTinh nvarchar(3),
	@DienThoai nvarchar(15),
	@SoNha nvarchar(100),
	@Duong nvarchar(100),
	@Phuong nvarchar(100),
	@Quan nvarchar(100),
	@Email nvarchar(100)
as
begin
	if	(@MaND is null) or (@TenND is null) or (@GioiTinh is null)
		or (@DienThoai is null)
		begin
		print N'Xảy ra lỗi..'
		print N'Thiếu thông tin đầu vào..'
	end
	else
		begin
		insert into nguoidung
		values(@MaND, @TenND, @GioiTinh, @DienThoai, @SoNha, @Duong, @Phuong, @Quan, @Email)
		print N'Đã thêm thông tin của người dùng ' + @TenND + N' thành công'
	end
end
exec insertNguoidung '11',N'Dũng Lò Vôi',N'Nam','065364291','272',N'CMT8','P5','Q3','dunglovoi@gmail.com'
exec insertNguoidung null,N'Dũng Lò Vôi',N'Nam',null,'272',N'CMT8','P5','Q3','dunglovoi@gmail.com'
go

-- SP chèn dữ liệu vào bảng NHATRO
if OBJECT_ID('insertNhatro') is not null
	drop procedure insertNhatro
go
create procedure insertNhatro
	@MaNT int,
	@MaLN int,
	@MaND int,
	@DienTich float,
	@GiaPhong float,
	@SoNha nvarchar(100),
	@Duong nvarchar(100),
	@Phuong nvarchar(100),
	@Quan nvarchar(100),
	@MoTa nvarchar(100),
	@NgayDang date
as
begin
	if	(@MaNT is null) or (@MaND is null) or (@MaLN is null) 
		begin
		print N'Xảy ra lỗi..'
		print N'Thiếu thông tin đầu vào..'
	end
	else
		begin
		insert into nhatro
		values(@MaNT, @MaLN, @MaND, @DienTich, @GiaPhong, @SoNha, @Duong, @Phuong, @Quan, @MoTa, @NgayDang)
		print N'Đã thêm thông tin của nhà trọ thành công'
	end
end
exec insertNhatro '11','3','5','22','2600000','228',N'Lê Duẩn',N'P.Tây Thạnh','Q3',N'Đẹp, Gần đại sứ quán','2019/5/2'
exec insertNhatro '11','3',null,'22','2600000','228',N'Lê Duẩn',N'P.Tây Thạnh','Q3',N'Đẹp, Gần đại sứ quán','2019/5/2'
go

-- SP chèn dữ liệu vào bảng DANHGIA
if OBJECT_ID('insertDanhgia') is not null
	drop procedure insertDanhgia
go
create procedure insertDanhgia
	@ID int,
	@MaND int,
	@MaNT int,
	@LikeDisLike int,
	@NoiDung nvarchar(300)
as
begin
	if	(@ID is null) or (@MaND is null) or (@MaNT is null) 
		begin
		print N'Xảy ra lỗi..'
		print N'Thiếu thông tin đầu vào..'
	end
	else
		begin
		insert into danhgia
		values(@ID, @MaND, @MaNT, @LikeDisLike, @NoiDung)
		print N'Đã thêm thông tin đánh giá thành công'
	end
end
exec insertDanhgia '11','1','11','1',N'Có máy lạnh, an nình, đáng tiền'
exec insertDanhgia '11',null,'11','1',N'Có máy lạnh, an nình, đáng tiền'
go

-- 2.a :	SP Truy vấn tìm thông tin nhà trọ
if OBJECT_ID('findNhatro ') is not null
	drop procedure findNhatro 
go
create procedure 	findNhatro 
					@quan nvarchar(50),
					@DtMin float,
					@DtMax float,
					@DateMin date,
					@DateMax date,
					@CostMin float,
					@CostMax float,
					@LoaiNT nvarchar(40)
as
begin
	select 	N'Cho thuê phòng trọ tại ' + nt.SoNha + ' ' + nt.Duong + ' '+ nt.Phuong + ' ' + nt.Quan + ' ' as 'Thông tin nhà trọ',
			replace(convert(nvarchar, dientich),'.',',') + N' m²' as 'DienTich',
			replace(format(GiaPhong,'N0') + ' VND',',','.') as 'GiaPhong',
			MoTa, format(NgayDang,'dd/MM/yyyy') as 'NgayDang',
			'NguoiLienHe' = case nd.GioiTinh
			when 'Nam' then 'A. ' + TenND
			when N'Nữ' then 'C. ' + TenND end, nd.DienThoai as 'SdtLienHe',
			nd.SoNha + ' ' + nd.Duong + ' '+ nd.Phuong + ' ' + nd.Quan as 'DiaChiLienHe'
	from nhatro nt inner join nguoidung nd on nd.MaND = nt.NguoiLienHe
	inner join loainha ln on ln.MaLN = nt.MaLN
	where 	(nt.Quan like '%'+@quan+'%') and (DienTich between @DtMin and @DtMax) and 
			(NgayDang >= @DateMin and NgayDang <= @DateMax) and (GiaPhong between @CostMin and @CostMax) 
			and (ln.TenLN like '%'+@LoaiNT+'%')
end

exec findNhatro 'Q1','1','20','2018-08-02','2021-04-01','2000000','3000000',N'Trọ trung bình'
exec findNhatro 'Q2','7','15','2017-12-01','2021-08-04','1400000','2500000',N'Trọ nhỏ'
go

-- 2.b :	Hàm trả về mã người dùng
if OBJECT_ID('returnMaND') is not null
	drop function returnMaND
go

create function returnMaND(@TenND nvarchar(40), @DienThoai nvarchar(15))
returns table
as
return	(select MaND from nguoidung where TenND like @TenND and DienThoai like @DienThoai)
go


select * from returnMaND(N'Dũng Lò Vôi','0653642912')

-- 2.c :	Hàm trả về tổng số LIKE và DISLIKE của nhà trọ tham số đầu vào
-- Tổng LIKE
if OBJECT_ID('totalLike') is not null
	drop function totalLike
go

create function totalLike(@MaNT int)
returns int
begin 
	return (select count(*) from danhgia where MaNT like @MaNT and LikeDisLike = 1)
end
go

-- Tổng DISLIKE
if OBJECT_ID('totalDislike') is not null
	drop function totalDislike
go

create function totalDislike(@MaNT int)
returns int
begin 
	return (select count(*) from danhgia where MaNT like @MaNT and LikeDisLike = 0)
end
go
-- 2.d :	Tạo một View lưu thông tin của TOP 10 nhà trọ có số người dùng LIKE nhiều nhất
if OBJECT_ID('TOP10_LIKE_NHATRO') is not null
	drop function TOP10_LIKE_NHATRO
go

create view TOP10_LIKE_NHATRO
as
select 		top 10
			dbo.totalLike(MaNT) as 'TongLike',
			N'Cho thuê phòng trọ tại ' + nt.SoNha + ' ' + nt.Duong + ' '+ nt.Phuong + ' ' + nt.Quan + ' ' as 'Thông tin nhà trọ',
			replace(convert(nvarchar, dientich),'.',',') + N' m²' as 'DienTich',
			replace(format(GiaPhong,'N0') + ' VND',',','.') as 'GiaPhong',
			MoTa, format(NgayDang,'dd/MM/yyyy') as 'NgayDang',
			'NguoiLienHe' = case nd.GioiTinh
			when 'Nam' then 'A. ' + TenND
			when N'Nữ' then 'C. ' + TenND end, nd.DienThoai as 'SdtLienHe',
			nd.SoNha + ' ' + nd.Duong + ' '+ nd.Phuong + ' ' + nd.Quan as 'DiaChiLienHe'
from nhatro nt inner join nguoidung nd on nd.MaND = nt.NguoiLienHe
inner join loainha ln on ln.MaLN = nt.MaLN
order by 'TongLike' desc
go

select * from TOP10_LIKE_NHATRO

-- 2.e : 	SP trả về - Mã nhà trọ - Tên người đánh giá - Trạng thái LIKE hay DISLIKE - Nội dung đánh giá
if OBJECT_ID('showDanhgia') is not null
	drop procedure showDanhgia
go
create procedure showDanhgia @MaNT int
as
begin
	if (@MaNT is null)
		begin
		print N'Người dùng chưa truyền vào MaNT'
		end
	else
		begin
			select 	nt.MaNT, nd.TenND, 'TrangThai' = case dg.LikeDisLike
			when '1' then 'Like'
			when '0' then 'Dislike' end, dg.NoiDung
			from nhatro nt inner join danhgia dg on nt.MaNT = dg.MaNT
			inner join nguoidung nd on nd.MaND = dg.MaND
			where nt.MaNT = @MaNT
		end
end

exec showDanhgia '8'
exec showDanhgia '10'
exec showDanhgia null

-- 3.1:	1. Viết một SP nhận một tham số đầu vào kiểu int là số lượng DISLIKE. SP này thực hiện
-- thao tác xóa thông tin của các nhà trọ và thông tin đánh giá của chúng, nếu tổng số lượng
-- DISLIKE tương ứng với nhà trọ này lớn hơn giá trị tham số được truyền vào.
if OBJECT_ID('sp_XoaNTDislike') is not null
	drop procedure sp_XoaNTDislike
go
create procedure sp_XoaNTDislike @Dislike int
as
begin try
	declare @tmpNT table(MaNT int)
	insert into @tmpNT
	select MaNT from nhatro where dbo.totalDislike(MaNT) >= @Dislike
	begin transaction
		delete from nhatro where MaNT in (select MaNT from @tmpNT)
		delete from danhgia where MaNT in (select MaNT from @tmpNT)
		print 'Xoa thanh cong!!!'
	commit transaction
end try
begin catch
	rollback transaction
	print 'Xoa khong thanh cong!!!'
end catch

-- 3.2:	2. Viết một SP nhận hai tham số đầu vào là khoảng thời gian đăng tin. SP này thực hiện
-- thao tác xóa thông tin những nhà trọ được đăng trong khoảng thời gian được truyền vào qua các tham số.
if OBJECT_ID('sp_XoaNTByDangTin') is not null
	drop procedure sp_XoaNTByDangTin
go

create procedure sp_XoaNTByDangTin @DateMin date, @DateMax date
as
begin try
	declare @tmpNT table(MaNT int)
	insert into @tmpNT
	select MaNT from nhatro where (NgayDang >= @DateMin and NgayDang <= @DateMax)
	begin transaction
		delete from nhatro where MaNT in (select MaNT from @tmpNT)	
		print N'Xóa thành công nhà trọ ở giữa ' + cast(@DateMin as nvarchar) + N' và ' + cast(@DateMax as nvarchar)
	commit transaction
end try
begin catch
	rollback transaction
	print N'Xóa không thành công!!!'
	print N'Không có nhà trọ nào ở giữa ' + cast(@DateMin as nvarchar) + N' và ' + cast(@DateMax as nvarchar)
end catch



